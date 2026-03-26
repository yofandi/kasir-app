<?php

namespace App\Http\Controllers\Apps;

use Carbon\Carbon;
use Inertia\Inertia;
use App\Models\Transaction;
use App\Exports\SalesExport;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\PDF;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;

class SaleController extends Controller
{
    /**
     * index
     *
     * @return void
     */
    public function index()
    {
        // Get all sales data with relationships
        $sales = Transaction::with('cashier', 'customer')->orderBy('id', 'DESC')->cursorPaginate(10);
        // dd($sales);
        // Get total sales
        $total = Transaction::sum('grand_total');


        return Inertia::render('Apps/Sales/Index', [
            'sales' => [
                'data' => $sales->items(),

                'prev_page_url' => $sales->previousPageUrl(),
                'next_page_url' => $sales->nextPageUrl(),

                // Offset pagination meta
                'from' => null,
                'to' => null,
                'total' => null,

                // Dummy pagination numbers
                'links' => [
                    [
                        'url' => $sales->previousPageUrl(),
                        'label' => '&laquo; Previous',
                        'active' => false,
                    ],
                    [
                        'url' => $sales->nextPageUrl(),
                        'label' => 'Next &raquo;',
                        'active' => false,
                    ],
                ],
            ],
            'total' => (int) $total
        ]);
    }

    /**
     * filter
     *
     * @param  mixed $request
     * @return void
     */
    public function filter(Request $request)
    {
        $request->validate([
            'start_date'  => 'required',
            'end_date'    => 'required',
        ]);

        //get data sales by range date
        $sales = Transaction::with('cashier', 'customer')
            ->whereDate('created_at', '>=', $request->start_date)
            ->whereDate('created_at', '<=', $request->end_date)
            ->orderBy('id', 'DESC')->cursorPaginate(10);

        //get total sales by range date
        $total = Transaction::whereDate('created_at', '>=', $request->start_date)
            ->whereDate('created_at', '<=', $request->end_date)
            ->sum('grand_total');

        return Inertia::render('Apps/Sales/Index', [
            'sales'    => [
                'data' => $sales->items(),

                'prev_page_url' => $sales->previousPageUrl(),
                'next_page_url' => $sales->nextPageUrl(),

                // Offset pagination meta
                'from' => null,
                'to' => null,
                'total' => null,

                // Dummy pagination numbers
                'links' => [
                    [
                        'url' => $sales->previousPageUrl(),
                        'label' => '&laquo; Previous',
                        'active' => false,
                    ],
                    [
                        'url' => $sales->nextPageUrl(),
                        'label' => 'Next &raquo;',
                        'active' => false,
                    ],
                ],
            ],
            'total'    => (int) $total
        ]);
    }

    /**
     * export
     *
     * @param  mixed $request
     * @return void
     */
    public function export(Request $request)
    {
        return Excel::download(new SalesExport($request->start_date, $request->end_date), 'sales : ' . $request->start_date . ' — ' . $request->end_date . '.xlsx');
    }
    /**
     * pdf
     *
     * @param  mixed $request
     * @return void
     */
    public function pdf(Request $request)
    {
        $request->validate([
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date',
        ]);

        $query = Transaction::with('cashier', 'customer');

        $query->when($request->start_date, function ($q) use ($request) {
            $startDate = Carbon::parse($request->start_date)->format('Y-m-d');
            $q->whereDate('created_at', '>=', $startDate);
        });

        $query->when($request->end_date, function ($q) use ($request) {
            $endDate = Carbon::parse($request->end_date)->format('Y-m-d');
            $q->whereDate('created_at', '<=', $endDate);
        });

        $sales = $query->get();

        $total = (clone $query)->sum('grand_total');

        $from = $request->start_date;
        $to = $request->end_date;

        //load view PDF with data
        $pdf = PDF::loadView('exports.sales', compact('sales', 'total', 'from', 'to'));

        //return PDF for preview / download
        $filename = 'sales';
        if ($request->start_date && $request->end_date) {
            $filename .= ' : ' . $request->start_date . ' — ' . $request->end_date;
        } elseif ($request->start_date) {
            $filename .= ' : from ' . $request->start_date;
        } elseif ($request->end_date) {
            $filename .= ' : to ' . $request->end_date;
        } else {
            $filename .= ' : all';
        }
        $filename .= '.pdf';

        return $pdf->download($filename);
    }
}
