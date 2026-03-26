<script setup>
import { ref } from 'vue'
import { Head } from '@inertiajs/inertia-vue3'
//import inerita adapter
import { Inertia } from '@inertiajs/inertia'

import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import Pagination from '../../../Components/Paginations/Pagination.vue'

const pageTitle = ref('Report Sales')

// Define props
const props = defineProps({
  errors: { type: Object },
  sales: { type: Array },
  total: { type: Number, default: 0 },
})

//define state
const date_start = ref('' || new URL(document.location).searchParams.get('start_date'))
const date_end = ref('' || new URL(document.location).searchParams.get('end_date'))

const handleSearch = () => {
  if (!date_start.value || !date_end.value) {
    // Jika tanggal kosong, kembali ke halaman index tanpa filter
    Inertia.get(route('apps.sales.index'))
    return
  }
  const query = {
    start_date: date_start.value,
    end_date: date_end.value,
  }
  Inertia.get(route('apps.sales.filter'), query)
}

const handleExport = () => {
  window.open(
    route('apps.sales.export', {
      start_date: date_start.value,
      end_date: date_end.value,
    }),
    '_blank',
  )
}

const handleExportPDF = () => {
  window.open(
    route('apps.sales.pdf', {
      start_date: date_start.value,
      end_date: date_end.value,
    }),
    '_blank',
  )
}
</script>
<template>
  <Head>
    <title>Sales</title>
  </Head>
  <BreadcrumbDefault :pageTitle="pageTitle" />
  <div
    class="rounded-sm border border-stroke bg-white px-4 sm:px-6 pt-6 pb-4 shadow-default dark:border-strokedark dark:bg-boxdark w-full"
  >
    <h2 class="text-white font-semibold text-lg mb-4">{{ pageTitle }}</h2>

    <form class="w-full mb-5" @submit.prevent="handleSearch">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 w-full">
        <!-- Date Start -->
        <div class="w-full">
          <input
            v-model="date_start"
            type="date"
            class="w-full h-11 px-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
          />
        </div>

        <!-- Date End -->
        <div class="w-full">
          <input
            v-model="date_end"
            type="date"
            class="w-full h-11 px-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
          />
        </div>

        <!-- Submit -->
        <div class="w-full">
          <button
            type="submit"
            class="w-full h-11 inline-flex items-center justify-center px-4 text-sm font-medium text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 rounded-lg transition dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          >
            Search
          </button>
        </div>
      </div>
    </form>
    <div class="pt-2 pb-2 w-full flex justify-end items-center">
      <!-- Tombol NEW -->
      <button
        @click="handleExport"
        class="inline-flex items-center justify-center px-4 py-3 text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:ring-green-300 rounded-lg transition whitespace-nowrap"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="16"
          height="16"
          fill="currentColor"
          class="bi bi-file-earmark-excel"
          viewBox="0 0 16 16"
        >
          <path
            d="M5.884 6.68a.5.5 0 1 0-.768.64L7.349 10l-2.233 2.68a.5.5 0 0 0 .768.64L8 10.781l2.116 2.54a.5.5 0 0 0 .768-.641L8.651 10l2.233-2.68a.5.5 0 0 0-.768-.64L8 9.219l-2.116-2.54z"
          />
          <path
            d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"
          />
        </svg>
        <span class="ml-2">Export to Excel</span>
      </button>

      <button
        @click="handleExportPDF"
        type="button"
        class="inline-flex items-center justify-center px-4 py-3 ms-2 text-sm font-medium text-white bg-gray-600 hover:bg-gray-700 focus:ring-4 focus:ring-gray-300 rounded-lg transition whitespace-nowrap"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="16"
          height="16"
          fill="currentColor"
          class="bi bi-file-earmark-pdf"
          viewBox="0 0 16 16"
        >
          <path
            d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"
          />
          <path
            d="M4.603 14.087a.8.8 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.7 7.7 0 0 1 1.482-.645 20 20 0 0 0 1.062-2.227 7.3 7.3 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.188-.012.396-.047.614-.084.51-.27 1.134-.52 1.794a11 11 0 0 0 .98 1.686 5.8 5.8 0 0 1 1.334.05c.364.066.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.86.86 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.7 5.7 0 0 1-.911-.95 11.7 11.7 0 0 0-1.997.406 11.3 11.3 0 0 1-1.02 1.51c-.292.35-.609.656-.927.787a.8.8 0 0 1-.58.029m1.379-1.901q-.25.115-.459.238c-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361q.016.032.026.044l.035-.012c.137-.056.355-.235.635-.572a8 8 0 0 0 .45-.606m1.64-1.33a13 13 0 0 1 1.01-.193 12 12 0 0 1-.51-.858 21 21 0 0 1-.5 1.05zm2.446.45q.226.245.435.41c.24.19.407.253.498.256a.1.1 0 0 0 .07-.015.3.3 0 0 0 .094-.125.44.44 0 0 0 .059-.2.1.1 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a4 4 0 0 0-.612-.053zM8.078 7.8a7 7 0 0 0 .2-.828q.046-.282.038-.465a.6.6 0 0 0-.032-.198.5.5 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822q.036.167.09.346z"
          />
        </svg>
        <span class="ml-2">Export to Pdf</span>
      </button>
    </div>
    <!-- Table Wrapper -->
    <div class="w-full overflow-x-auto rounded-lg border border-gray-700">
      <table class="w-full min-w-full border-collapse">
        <thead>
          <tr class="bg-gray-800 text-gray-400 text-xs uppercase tracking-wider">
            <th class="px-4 py-3 text-left">Date</th>
            <th class="px-4 py-3 text-left">Invoice</th>
            <th class="px-4 py-3 text-left">Cashier</th>
            <th class="px-4 py-3 text-left">Customer</th>
            <th class="px-4 py-3 text-left">Total</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(sale, index) in sales.data"
            :key="index"
            class="border-t border-gray-700 hover:bg-gray-800/50 transition"
          >
            <td class="px-4 py-3 text-white text-sm">{{ sale.created_at }}</td>
            <td class="px-4 py-3 text-white text-sm">{{ sale.invoice }}</td>
            <td class="px-4 py-3 text-white text-sm">{{ sale.cashier.name }}</td>
            <td class="px-4 py-3 text-white text-sm">{{ sale.customer.name }}</td>
            <td class="px-4 py-3 text-white text-sm text-right">
              {{ 'Rp.' + formatPrice(sale.grand_total) }}
            </td>
          </tr>
          <tr class="border-t border-gray-700 hover:bg-gray-800/50 transition">
            <td colspan="4" class="px-4 py-3 text-white text-sm font-semibold text-right">
              Total Sales:
            </td>
            <td class="px-4 py-3 text-white text-sm font-semibold text-right">
              {{ 'Rp.' + formatPrice(total) }}
            </td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- pagination -->
    <Pagination :links="sales" align="end" />
  </div>
</template>
