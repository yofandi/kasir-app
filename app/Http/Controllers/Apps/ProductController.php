<?php

namespace App\Http\Controllers\Apps;

use Inertia\Inertia;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //get products
        $products = Product::when(request()->q, function ($products) {
            $products = $products->where('title', 'like', '%' . request()->q . '%');
        })->latest()->paginate(5);

        //return inertia
        return Inertia::render('Apps/Products/Index', [
            'products' => $products,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //get categories
        $categories = Category::all();

        //return inertia
        return Inertia::render('Apps/Products/Create', [
            'categories' => $categories
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        /**
         * validate
         */
        $request->validate([
            'image'         => 'required|image|mimes:jpeg,jpg,png|max:500',
            'barcode'       => 'required|unique:products',
            'title'         => 'required',
            'description'   => 'required',
            'category_id'   => 'required',
            'buy_price'     => 'required',
            'sell_price'    => 'required',
            'stock'         => 'required',
        ]);

        try {
            //upload image
            $image = $request->file('image');
            Storage::disk('public')->putFileAs('products', $image, $image->hashName());

            //create product
            Product::create([
                'image'         => $image->hashName(),
                'barcode'       => $request->barcode,
                'title'         => $request->title,
                'description'   => $request->description,
                'category_id'   => $request->category_id,
                'buy_price'     => $request->buy_price,
                'sell_price'    => $request->sell_price,
                'stock'         => $request->stock,
            ]);

            //redirect
            return redirect()->route('apps.products.index');
        } catch (\Exception $e) {
            // Jika upload gagal, hapus file jika sudah terupload sebagian
            if (isset($image) && Storage::disk('public')->exists('products/' . $image->hashName())) {
                Storage::disk('public')->delete('products/' . $image->hashName());
            }

            // Redirect back dengan error message
            return redirect()->back()->withErrors(['image' => 'Failed to upload image. Please try again.']);
        }
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
    public function edit(Product $product)
    {
        //get categories
        $categories = Category::all();

        return Inertia::render('Apps/Products/Edit', [
            'product' => $product,
            'categories' => $categories
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        /**
         * validate
         */
        $request->validate([
            'barcode'       => 'required|unique:products,barcode,' . $product->id,
            'title'         => 'required',
            'description'   => 'required',
            'category_id'   => 'required',
            'buy_price'     => 'required',
            'sell_price'    => 'required',
            'stock'         => 'required',
        ]);

        //check image update
        if ($request->file('image')) {

            try {
                //remove old image
                Storage::disk('public')->delete('products/' . basename($product->image));

                //upload new image
                $image = $request->file('image');
                Storage::disk('public')->putFileAs('products', $image, $image->hashName());

                //update product with new image
                $product->update([
                    'image' => $image->hashName(),
                    'barcode'       => $request->barcode,
                    'title'         => $request->title,
                    'description'   => $request->description,
                    'category_id'   => $request->category_id,
                    'buy_price'     => $request->buy_price,
                    'sell_price'    => $request->sell_price,
                    'stock'         => $request->stock,
                ]);
            } catch (\Exception $e) {
                // Jika upload gagal, redirect back dengan error
                return redirect()->back()->withErrors(['image' => 'Failed to update image. Please try again.']);
            }
        }

        //update product without image
        $product->update([
            'barcode'       => $request->barcode,
            'title'         => $request->title,
            'description'   => $request->description,
            'category_id'   => $request->category_id,
            'buy_price'     => $request->buy_price,
            'sell_price'    => $request->sell_price,
            'stock'         => $request->stock,
        ]);

        //redirect
        return redirect()->route('apps.products.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            //find by ID
            $product = Product::findOrFail($id);

            //remove image
            Storage::disk('public')->delete('products/' . basename($product->image));

            //delete
            $product->delete();

            //redirect
            return redirect()->route('apps.products.index');
        } catch (\Exception $e) {
            // Jika delete gagal, redirect back dengan error
            return redirect()->back()->withErrors(['delete' => 'Failed to delete product. Please try again.']);
        }
    }
}
