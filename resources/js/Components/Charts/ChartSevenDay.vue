<script setup lang="ts">
import { computed } from 'vue' // 'reactive' juga bisa digunakan jika preferensi

// Impor komponen Chart.js yang diperlukan dari 'vue-chart-3'
import { BarChart } from 'vue-chart-3'
// Impor ChartJS dari 'chart.js' untuk registrasi (penting!)
import { Chart, registerables } from 'chart.js'

// Daftarkan semua elemen Chart.js yang diperlukan (seperti scales, elements, dll.)
// Ini penting agar Chart.js dapat merender grafik dengan benar.
Chart.register(...registerables)

const props = defineProps(['data'])

// method random color
function randomBackgroundColor(length: number): string[] {
  const data: string[] = []
  for (let i = 0; i < length; i++) {
    data.push(getRandomColor())
  }
  return data
}

// method generate random color
function getRandomColor(): string {
  const letters = '0123456789ABCDEF'.split('')
  let color = '#'
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)]
  }
  return color
}

// option chart
// Menggunakan computed untuk options agar responsif terhadap perubahan data atau props
const options = computed(() => ({
  responsive: true,
  maintainAspectRatio: false, // Penting agar chart bisa menyesuaikan ukuran div
  plugins: {
    legend: {
      labels: {
        fontFamily: 'Satoshi, sans-serif',
      },
      display: false,
    },
    title: {
      display: false,
    },
    tooltip: {
      callbacks: {
        label: function (context: any) {
          let label = context.dataset.label || ''
          if (label) {
            label += ': '
          }
          if (context.parsed.y !== null) {
            label += '$ ' + context.parsed.y.toLocaleString('id-ID') // Format mata uang di tooltip
          }
          return label
        },
      },
    },
  },
  // 'beginZero' di Chart.js v3+ diatur di dalam 'scales'
  scales: {
    y: {
      beginAtZero: true, // Memastikan sumbu Y dimulai dari nol
      title: {
        color: 'white',
        display: true,
        text: 'Jumlah Penjualan', // Anda bisa menambahkan label sumbu Y
      },
    },
    x: {
      title: {
        display: true,
        text: 'Tanggal', // Anda bisa menambahkan label sumbu X,
        color: 'white',
        font: {
          size: 22,
        },
      },
    },
  },
}))

// chart sell week
// Menggunakan computed agar data chart diperbarui otomatis jika props berubah, digunakan untuk menampung data yang diambil dari props.
const chartSellWeek = computed(() => ({
  labels: props.data.sales_date,
  datasets: [
    {
      data: props.data.grand_total,
      backgroundColor: randomBackgroundColor(props.data.sales_date.length),
      borderColor: randomBackgroundColor(props.data.sales_date.length), // Menambahkan border color
      borderWidth: 1,
    },
  ],
}))

// Dalam <script setup>, tidak perlu ada return statement secara eksplisit
// variabel dan fungsi yang dideklarasikan akan otomatis diekspos ke template.
</script>
<template>
  <div
    class="col-span-12 rounded-sm border border-stroke bg-white px-5 pt-7.5 pb-5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:col-span-8"
  >
    <div class="flex flex-wrap items-start justify-between gap-3 sm:flex-nowrap">
      <div class="flex w-full flex-wrap gap-3 sm:gap-5">
        <div class="flex min-w-47.5">
          <div class="w-full">
            <p class="font-semibold text-secondary">SALES CHART 7 DAYS</p>
          </div>
        </div>
      </div>
    </div>
    <div class="mt-6">
      <div id="chartSevenDay" class="-ml-5">
        <BarChart :chartData="chartSellWeek" :options="options" />
      </div>
    </div>
  </div>
</template>
