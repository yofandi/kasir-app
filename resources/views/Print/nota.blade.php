<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Nota Pembelian</title>

    <!-- Tailwind CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        @media print {
            @page {
                width: 80mm;
                margin: 0;
            }

            * {
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            body {
                margin: 0;
            }
        }
    </style>

    <script>
        window.onload = function() {
            window.print();
            window.onafterprint = () => window.close();
        }
    </script>
</head>

<body class="bg-white">

    <div class="w-[80mm] p-4 text-xs font-sans">

        <div class="text-center mb-3">
            <div class="font-bold text-sm uppercase">SantriKoding</div>
            <div>Alamat: Desa Gedangalas, Kec. Gajah, Kab. Demak</div>
            <div>Telp: 0857-9087-9087</div>
        </div>

        <div class="border-t border-dashed border-black my-2"></div>

        <table class="w-full text-xs mb-2">
            <tr>
                <td>TANGGAL</td>
                <td>:</td>
                <td>{{ $transaction->created_at }}</td>
            </tr>
            <tr>
                <td>FAKTUR</td>
                <td>:</td>
                <td>{{ $transaction->invoice }}</td>
            </tr>
            <tr>
                <td>KASIR</td>
                <td>:</td>
                <td>{{ $transaction->cashier->name ?? '' }}</td>
            </tr>
            <tr>
                <td>PEMBELI</td>
                <td>:</td>
                <td>{{ $transaction->customer->name ?? 'Umum' }}</td>
            </tr>
        </table>

        <div class="border-t border-dashed border-black my-2"></div>

        <table class="w-full text-xs">
            <thead>
                <tr class="font-bold">
                    <td>PRODUK</td>
                    <td class="text-center">QTY</td>
                    <td class="text-right">HARGA</td>
                </tr>
            </thead>

            <tbody>
                @foreach ($transaction->details as $item)
                    <tr>
                        <td>{{ $item->product->title }}</td>
                        <td class="text-center">{{ $item->qty }}</td>
                        <td class="text-right">{{ formatPrice($item->price) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <div class="border-t border-dashed border-black my-2"></div>

        <table class="w-full text-xs">
            <tr>
                <td>SUB TOTAL</td>
                <td class="text-right">{{ formatPrice($transaction->grand_total) }}</td>
            </tr>
            <tr>
                <td>DISKON</td>
                <td class="text-right">{{ formatPrice($transaction->discount) }}</td>
            </tr>
            <tr>
                <td>TUNAI</td>
                <td class="text-right">{{ formatPrice($transaction->cash) }}</td>
            </tr>
            <tr class="font-bold">
                <td>KEMBALI</td>
                <td class="text-right">{{ formatPrice($transaction->change) }}</td>
            </tr>
        </table>

        <div class="text-center my-3">
            =====================================
        </div>

        <div class="text-center">
            TERIMA KASIH <br>
            ATAS KUNJUNGAN ANDA
        </div>

    </div>

</body>

</html>
