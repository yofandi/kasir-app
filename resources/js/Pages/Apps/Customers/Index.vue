<script setup>
import { ref } from 'vue'
import { Head, Link } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'
// import sweetalert2
import Swal from 'sweetalert2'

import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import Pagination from '../../../Components/Paginations/Pagination.vue'

// state search (ambil dari query string jika ada)
const search = ref(new URL(document.location).searchParams.get('q') || '')

// method search
const handleSearch = () => {
  Inertia.get(route('apps.customers.index'), {
    q: search.value, // kirim query param
  })
}

const pageTitle = ref('Customers')

defineProps({
  customers: Object,
})

const destroy = (id) => {
  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!',
  }).then((result) => {
    if (result.isConfirmed) {
      // DELETE via Inertia
      Inertia.delete(route('apps.customers.destroy', id), {
        onSuccess: () => {
          Swal.fire({
            title: 'Deleted!',
            text: 'Customer deleted successfully.',
            icon: 'success',
            timer: 2000,
            showConfirmButton: false,
          })
        },
        onError: (errors) => {
          Swal.fire({
            title: 'Error!',
            text: 'Failed to delete customer. Please try again.',
            icon: 'error',
            confirmButtonColor: '#d33',
          })
        },
      })
    }
  })
}
</script>

<template>
  <Head>
    <title>Customers</title>
  </Head>
  <BreadcrumbDefault :pageTitle="pageTitle" />
  <div
    class="rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1 overflow-x-auto"
  >
    <h2 class="text-white font-semibold text-lg mb-4">Customers</h2>

    <form class="w-full pb-5" @submit.prevent="handleSearch">
      <label
        for="default-search"
        class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white"
      >
        Search
      </label>

      <div class="flex items-center gap-3">
        <!-- Tombol NEW -->
        <Link
          :href="route('apps.customers.create')"
          v-if="hasAnyPermission(['customers.create'])"
          class="inline-flex items-center justify-center px-4 py-3 text-sm font-medium text-white bg-green-600 hover:bg-green-700 focus:ring-4 focus:ring-green-300 rounded-lg transition whitespace-nowrap"
        >
          <i class="fa fa-plus-circle me-2"></i>
          NEW
        </Link>
        <!-- Input Search -->
        <div class="relative flex-grow">
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
            placeholder="Search Customer Name..."
            v-model="search"
          />
          <button
            type="submit"
            class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          >
            Search
          </button>
        </div>
      </div>
    </form>
    <!-- Wrapper dengan scroll horizontal -->
    <div class="overflow-x-auto rounded-lg shadow border border-gray-700">
      <table class="min-w-full table-fixed border-collapse">
        <thead>
          <tr class="bg-gray-800 text-gray-400 text-xs uppercase tracking-wider">
            <th class="w-1/6 text-left px-4 py-3">No.</th>
            <th class="w-1/4 text-left px-4 py-3">Full Name</th>
            <th class="w-1/4 text-left px-4 py-3">No. Telp</th>
            <th class="w-1/4 text-left px-4 py-3">Address</th>
            <th class="w-1/4 text-left px-4 py-3">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="(customer, index) in customers.data"
            :key="index"
            class="border-t border-gray-700 hover:bg-gray-800/50 transition"
          >
            <td class="text-white text-sm px-4 py-3">{{ index + 1 }}</td>
            <td class="text-white text-sm px-4 py-3">{{ customer.name }}</td>
            <td class="text-white text-sm px-4 py-3">{{ customer.no_telp }}</td>
            <td class="text-white text-sm px-4 py-3">{{ customer.address }}</td>
            <td class="text-white text-sm px-4 py-3 whitespace-nowrap">
              <Link
                :href="route('apps.customers.edit', customer.id)"
                v-if="hasAnyPermission(['customers.edit'])"
                class="inline-flex items-center px-3 py-1 me-2 text-xs font-medium text-white bg-green-600 hover:bg-green-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500/50"
              >
                <i class="fa fa-pencil-alt me-1"></i> EDIT
              </Link>
              <button
                @click.prevent="destroy(customer.id)"
                v-if="hasAnyPermission(['customers.delete'])"
                class="inline-flex items-center px-3 py-1 text-xs font-medium text-white bg-red-600 hover:bg-red-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-500/50"
              >
                <i class="fa fa-trash me-1"></i> DELETE
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!-- pagination -->
    <Pagination :links="customers" align="end" />
  </div>
</template>
