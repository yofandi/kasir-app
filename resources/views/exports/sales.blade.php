<div class="title" style="padding-bottom: 13px">
    <div style="text-align: center; text-transform: uppercase; font-size: 15px">
        Laporan Penjualan
    </div>
    <div style="text-align: center">
        Periode: {{ $from ?? '-' }} s/d {{ $to ?? '-' }}
    </div>
</div>

<table style="width: 100%; border-collapse: collapse;">
    <thead>
        <tr style="background-color: #e6e6e7;">
            <th style="padding:5px;">Date</th>
            <th style="padding:5px;">Invoice</th>
            <th style="padding:5px;">Cashier</th>
            <th style="padding:5px;">Customer</th>
            <th style="padding:5px; text-align:right;">Total</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($sales as $sale)
            <tr>
                <td style="padding:5px;">{{ $sale->created_at }}</td>
                <td style="padding:5px;">{{ $sale->invoice }}</td>
                <td style="padding:5px;">{{ $sale->cashier->name ?? '' }}</td>
                <td style="padding:5px;">{{ $sale->customer->name ?? 'Umum' }}</td>
                <td style="padding:5px; text-align:right;">
                    {{ formatPrice($sale->grand_total) }}
                </td>
            </tr>
        @endforeach

        <tr>
            <td colspan="4" style="text-align:right; font-weight:bold; background-color:#e6e6e7;">
                TOTAL
            </td>
            <td style="text-align:right; font-weight:bold; background-color:#e6e6e7;">
                {{ formatPrice($total) }}
            </td>
        </tr>
    </tbody>
</table>
