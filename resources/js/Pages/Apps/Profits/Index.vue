<script setup>
// vue
import { ref } from 'vue'
// inertia
import { Head } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'

import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import Pagination from '../../../Components/Paginations/Pagination.vue'

const pageTitle = ref('Report Profits')
// props
const props = defineProps({
  errors: Object,
  profits: Array,
  total: Number,
})

// state
const start_date = ref(new URL(document.location).searchParams.get('start_date') || '')

const end_date = ref(new URL(document.location).searchParams.get('end_date') || '')

// methods
const filter = () => {
  Inertia.get(route('apps.profits.filter'), {
    start_date: start_date.value,
    end_date: end_date.value,
  })
}

const handleExport = () => {
  window.open(
    route('apps.profits.export', {
      start_date: start_date.value,
      end_date: end_date.value,
    }),
    '_blank',
  )
}

const handleExportPDF = () => {
  window.open(
    route('apps.profits.pdf', {
      start_date: start_date.value,
      end_date: end_date.value,
    }),
    '_blank',
  )
}
</script>
<template>
  <Head>
    <title>Report Profits - Aplikasi Kasir</title>
  </Head>

  <BreadcrumbDefault :pageTitle="pageTitle" />

  <div
    class="rounded-sm border border-stroke bg-white px-4 sm:px-6 pt-6 pb-4 shadow-default dark:border-strokedark dark:bg-boxdark w-full"
  >
    <!-- TITLE -->
    <h2 class="text-white font-semibold text-lg mb-4">{{ pageTitle }}</h2>

    <!-- FILTER -->
    <form class="w-full mb-5" @submit.prevent="filter">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 w-full">
        <!-- START DATE -->
        <div class="w-full">
          <input
            v-model="start_date"
            type="date"
            class="w-full h-11 px-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
          />
          <div v-if="errors.start_date" class="text-red-500 text-sm mt-1">
            {{ errors.start_date }}
          </div>
        </div>

        <!-- END DATE -->
        <div class="w-full">
          <input
            v-model="end_date"
            type="date"
            class="w-full h-11 px-3 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
          />
          <div v-if="errors.end_date" class="text-red-500 text-sm mt-1">
            {{ errors.end_date }}
          </div>
        </div>

        <!-- BUTTON -->
        <div class="w-full">
          <button
            type="submit"
            class="w-full h-11 inline-flex items-center justify-center px-4 text-sm font-medium text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 rounded-lg transition"
          >
            Filter
          </button>
        </div>
      </div>
    </form>

    <!-- EXPORT -->
    <div class="pt-2 pb-2 w-full flex justify-end items-center">
      <button
        @click="handleExport"
        class="inline-flex items-center justify-center px-4 py-3 text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:ring-green-300 rounded-lg transition"
      >
        Export to Excel
      </button>

      <button
        @click="handleExportPDF"
        class="inline-flex items-center justify-center px-4 py-3 ms-2 text-sm font-medium text-white bg-gray-600 hover:bg-gray-700 focus:ring-4 focus:ring-gray-300 rounded-lg transition"
      >
        Export to PDF
      </button>
    </div>

    <!-- TABLE -->
    <div v-if="profits?.length" class="w-full overflow-x-auto rounded-lg border border-gray-700">
      <table class="w-full min-w-full border-collapse">
        <thead>
          <tr class="bg-gray-800 text-gray-400 text-xs uppercase tracking-wider">
            <th class="px-4 py-3 text-left">Date</th>
            <th class="px-4 py-3 text-left">Invoice</th>
            <th class="px-4 py-3 text-right">Total</th>
          </tr>
        </thead>

        <tbody>
          <tr
            v-for="profit in profits"
            :key="profit.id"
            class="border-t border-gray-700 hover:bg-gray-800/50 transition"
          >
            <td class="px-4 py-3 text-white text-sm">
              {{ profit.created_at }}
            </td>
            <td class="px-4 py-3 text-white text-sm">
              {{ profit.transaction.invoice }}
            </td>
            <td class="px-4 py-3 text-white text-sm text-right">
              {{ 'Rp.' + formatPrice(profit.total) }}
            </td>
          </tr>

          <!-- TOTAL -->
          <tr class="border-t border-gray-700">
            <td colspan="2" class="px-4 py-3 text-white text-sm font-semibold text-right">
              Total Profit:
            </td>
            <td class="px-4 py-3 text-white text-sm font-semibold text-right">
              {{ 'Rp.' + formatPrice(total) }}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
