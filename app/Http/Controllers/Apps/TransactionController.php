<?php

namespace App\Http\Controllers\Apps;

use App\Models\Cart;
use Inertia\Inertia;
use App\Models\Product;
use App\Models\Customer;
use App\Models\Transaction;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Exceptions\CartEmptyException;
use Illuminate\Support\Facades\Auth;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //get cart
        $carts = Cart::with('product')->where('cashier_id', Auth::user()->id)->latest()->get();

        //get all customers
        $customers = Customer::latest()->get();

        return Inertia::render('Apps/Transactions/Index', [
            'carts'         => $carts,
            'carts_total'   => $carts->sum('price'),
            'customers'     => $customers
        ]);
    }

    /**
     * searchProduct
     *
     * @param  mixed $request
     * @return void
     */
    public function searchProduct(Request $request)
    {
        //find product by barcode
        $product = Product::where('barcode', $request->barcode)->first();

        if ($product) {
            return response()->json([
                'success' => true,
                'data'    => $product
            ]);
        }

        return response()->json([
            'success' => false,
            'data'    => null
        ]);
    }

    /**
     * addToCart
     *
     * @param  mixed $request
     * @return void
     */
    public function addToCart(Request $request)
    {
        //check stock product
        if (Product::whereId($request->product_id)->first()->stock < $request->qty) {

            //redirect
            return redirect()->back()->with('error', 'Out of Stock Product!.');
        }

        //check cart
        $cart = Cart::with('product')
            ->where('product_id', $request->product_id)
            ->where('cashier_id', Auth::user()->id)
            ->first();

        if ($cart) {

            //increment qty
            $cart->increment('qty', $request->qty);

            //sum price * quantity
            $cart->price  = $cart->product->sell_price * $cart->qty;

            $cart->save();
        } else {

            //insert cart
            Cart::create([
                'id'          => Str::uuid(),
                'cashier_id'    => Auth::user()->id,
                'product_id'    => $request->product_id,
                'qty'           => $request->qty,
                'price'         => $request->sell_price * $request->qty,
            ]);
        }

        return redirect()->route('apps.transactions.index')->with('success', 'Product Added Successfully!.');
    }

    /**
     * destroyCart
     *
     * @param  mixed $request
     * @return void
     */
    public function destroyCart(Request $request)
    {
        //find cart by ID
        $cart = Cart::with('product')
            ->whereId($request->cart_id)
            ->first();

        if (!$cart) {
            return redirect()->back()->with('error', 'Cart not found.');
        }

        //delete cart
        $cart->delete();

        return redirect()->route('apps.transactions.index')->with('success', 'Product Removed Successfully!.');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'grand_total' => 'required|numeric|min:1',
            'cash'        => 'required|numeric|min:1',
            'discount'    => 'nullable|numeric|min:0',
        ]);

        DB::beginTransaction();

        try {

            /**
             * generate invoice
             */
            $length = 10;
            $random = '';
            for ($i = 0; $i < $length; $i++) {
                $random .= rand(0, 1)
                    ? rand(0, 9)
                    : chr(rand(ord('a'), ord('z')));
            }

            $invoice = 'TRX-' . Str::upper($random);

            // insert transaction
            $transaction = Transaction::create([
                'cashier_id'  => Auth::id(),
                'customer_id' => $request->customer_id,
                'invoice'     => $invoice,
                'cash'        => $request->cash,
                'change'      => $request->change,
                'discount'    => $request->discount,
                'grand_total' => $request->grand_total,
            ]);

            // get carts
            $carts = Cart::where('cashier_id', Auth::id())->get();

            if ($carts->isEmpty()) {
                throw new CartEmptyException();
            }

            foreach ($carts as $cart) {

                // insert detail
                $transaction->details()->create([
                    'transaction_id' => $transaction->id,
                    'product_id'     => $cart->product_id,
                    'qty'            => $cart->qty,
                    'price'          => $cart->price,
                ]);

                // hitung profit
                $profits =
                    ($cart->product->sell_price * $cart->qty)
                    -
                    ($cart->product->buy_price * $cart->qty);

                // insert profits
                $transaction->profits()->create([
                    'transaction_id' => $transaction->id,
                    'total'          => $profits,
                ]);

                // update stock (AMAN)
                $product = Product::findOrFail($cart->product_id);

                if ($product->stock < $cart->qty) {
                    throw new \Exception("Stok {$product->title} tidak mencukupi!");
                }

                $product->decrement('stock', $cart->qty);
            }

            // delete carts
            Cart::where('cashier_id', Auth::id())->delete();

            DB::commit();

            // Return JSON response untuk axios
            return response()->json([
                'success' => true,
                'message' => 'Transaksi berhasil dibuat!',
                'data' => $transaction,
                'invoice' => $invoice
            ], 200);
        } catch (\Throwable $e) {

            DB::rollBack();

            // Redirect dengan error message
            return redirect()->back()->with('error', $e->getMessage());
        }
    }


    /**
     * print
     *
     * @param  mixed $request
     * @return void
     */
    public function print(Request $request)
    {
        //get transaction
        $transaction = Transaction::with('details.product', 'cashier', 'customer')->where('invoice', $request->invoice)->firstOrFail();

        //return view
        return view('print.nota', compact('transaction'));
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
