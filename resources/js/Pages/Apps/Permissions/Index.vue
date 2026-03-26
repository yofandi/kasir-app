<script setup lang="ts">
import { ref } from 'vue'
import { Head } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'

import Pagination from '../../../Components/Paginations/Pagination.vue'
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'

// state search (ambil dari query string jika ada)
const search = ref(new URL(document.location).searchParams.get('q') || '')

// method search
const handleSearch = () => {
  Inertia.get('/apps/permissions', {
    q: search.value, // kirim query param
  })
}

// props
const props = defineProps({
  permissions: {
    type: Object,
    required: true,
  },
})

const pageTitle = ref('Permissions')
</script>
<template>
  <Head>
    <title>Permissions</title>
  </Head>
  <BreadcrumbDefault :pageTitle="pageTitle" />
  <div
    class="rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1 overflow-x-auto"
  >
    <h2 class="text-white font-semibold text-lg mb-4">PERMISSIONS</h2>

    <form class="w-full pb-5" @submit.prevent="handleSearch">
      <label
        for="default-search"
        class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"
        >Search</label
      >
      <div class="relative w-full">
        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
          <svg
            class="w-4 h-4 text-gray-500 dark:text-gray-400"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 20 20"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"
            />
          </svg>
        </div>
        <input
          type="search"
          id="default-search"
          class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Search Permissions..."
          v-model="search"
        />
        <button
          type="submit"
          class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
        >
          Search
        </button>
      </div>
    </form>

    <table class="w-full table-auto border-collapse">
      <thead>
        <tr class="bg-gray-800 text-gray-400 text-xs uppercase">
          <th class="text-left px-4 py-3">Permission Name</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(permission, index) in permissions.data"
          :key="index"
          class="border-b border-gray-700"
        >
          <td class="text-white text-sm px-4 py-3">{{ permission.name }}</td>
        </tr>
      </tbody>
    </table>
    <Pagination :links="permissions" align="end" />
  </div>
</template>
