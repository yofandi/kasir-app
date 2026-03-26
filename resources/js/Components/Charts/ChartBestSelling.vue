<script lang="ts" setup>
import { computed } from 'vue' // 'reactive' juga bisa digunakan jika preferensi

// Impor komponen Chart.js yang diperlukan dari 'vue-chart-3'
import { DoughnutChart } from 'vue-chart-3'
// Impor ChartJS dari 'chart.js' untuk registrasi (penting!)
import { Chart, registerables } from 'chart.js'

// Daftarkan semua elemen Chart.js yang diperlukan (seperti scales, elements, dll.)
// Ini penting agar Chart.js dapat merender grafik dengan benar.
Chart.register(...registerables)

const props = defineProps(['data'])
console.log(props.data)

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
  },
  beginZero: true,
}))

//chart produk terlaris
const chartBestProduct = computed(() => ({
  labels: props.data.product || [], // Pastikan tidak kosong
  datasets: [
    {
      data: props.data.total || [], // Pastikan tidak kosong
      backgroundColor: randomBackgroundColor(5),
    },
  ],
}))

// Dalam <script setup>, tidak perlu ada return statement secara eksplisit
// variabel dan fungsi yang dideklarasikan akan otomatis diekspos ke template.
</script>
<template>
  <div
    class="col-span-12 rounded-sm border border-stroke bg-white p-7.5 shadow-default dark:border-strokedark dark:bg-boxdark xl:col-span-4"
  >
    <div class="mb-4 justify-between gap-4 sm:flex">
      <div>
        <h4 class="text-xl font-bold text-black dark:text-white">Best Selling Product</h4>
      </div>
    </div>

    <div>
      <div id="chartBestProduct" class="-ml-5 -mb-9">
        <DoughnutChart :chartData="chartBestProduct" :options="options" />
      </div>
    </div>
  </div>
</template>
