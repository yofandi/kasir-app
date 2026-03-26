<?php

namespace App\Exports;

use App\Models\Transaction;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class SalesExport implements FromView
{
    protected $startDate;
    protected $endDate;

    /**
     * __construct
     *
     * @param  mixed $startDate
     * @param  mixed $endDate
     * @return void
     */
    public function __construct($startDate, $endDate)
    {
        $this->startDate = $startDate;
        $this->endDate   = $endDate;
    }

    /**
     * @return \Illuminate\Contracts\View\View
     */
    public function view(): View
    {
        $query = Transaction::with('cashier', 'customer');

        $query->when($this->startDate, function ($q) {
            $q->whereDate('created_at', '>=', $this->startDate);
        });

        $query->when($this->endDate, function ($q) {
            $q->whereDate('created_at', '<=', $this->endDate);
        });

        $sales = $query->get();

        $total = (clone $query)->sum('grand_total');

        return view('exports.sales', [
            'sales' => $sales,
            'total' => $total,
        ]);
    }
}
