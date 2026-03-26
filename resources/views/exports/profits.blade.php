<div class="title" style="padding-bottom: 13px">
    <div style="text-align: center; text-transform: uppercase; font-size: 15px">
        Laporan Profits
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
            <th style="padding:5px; text-align:right;">Total</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($profits as $profit)
            <tr>
                <td>{{ $profit->created_at }}</td>
                <td>{{ $profit->transaction->invoice }}</td>
                <td class="text-end">{{ formatPrice($profit->total) }}</td>
            </tr>
        @endforeach
        <tr>
            <td colspan="2" class="text-end fw-bold" style="background-color: #e6e6e7;">TOTAL</td>
            <td class="text-end fw-bold" style="background-color: #e6e6e7;">{{ formatPrice($total) }}</td>
        </tr>
    </tbody>
</table>
