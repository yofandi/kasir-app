<script setup lang="ts">
import { computed, getCurrentInstance } from 'vue'
import { usePage } from '@inertiajs/inertia-vue3'

const instance = getCurrentInstance()
const globalHasAnyPermission = instance?.appContext.config.globalProperties.hasAnyPermission

const page = usePage()
const hasAnyPermission = (permissions: string[]): boolean => {
  // Jika permissions kosong atau undefined, anggap true (selalu tampil)
  if (!permissions || permissions.length === 0) {
    return true
  }

  // Ambil fungsi global hasAnyPermission dari instance Vue (didaftarkan di app.js)
  if (globalHasAnyPermission) {
    return globalHasAnyPermission(permissions)
  }
  // Fallback jika mixin tidak ditemukan (opsional)
  const auth = (page.props as any)?.auth
  const allPermissions = auth?.permissions ?? {}
  return permissions.some((p) => allPermissions[p])
}

const props = defineProps(['data'])
</script>
<template>
  <div
    class="col-span-12 rounded-sm border border-stroke bg-white px-5 pt-7.5 pb-5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5"
    v-if="hasAnyPermission(['dashboard.product_stock'])"
  >
    <div class="mb-3 justify-between gap-4 sm:flex">
      <div>
        <h4 class="text-xl font-bold text-black dark:text-white">Product Stock</h4>
      </div>
      <div></div>
    </div>
    <!-- Card Start -->
    <div
      class="mt-4 rounded-lg border border-gray-200 bg-gray-50 p-4 shadow-md dark:border-gray-700 dark:bg-gray-800"
      v-if="props.data.length > 0"
    >
      <ol class="list-decimal pl-5">
        <li
          v-for="product in props.data"
          :key="product.id"
          class="flex justify-between items-start mb-2 p-4 border border-gray-200 rounded-lg bg-white shadow-sm dark:bg-gray-800 dark:border-gray-700"
        >
          <div class="flex-1">
            <div class="font-bold text-gray-800 dark:text-white">{{ product.title }}</div>
            <div class="text-sm text-gray-500 dark:text-gray-400">
              Category: {{ product.category.name }}
            </div>
          </div>
          <span class="bg-red-500 text-white rounded-full px-3 py-1 text-sm">{{
            product.stock
          }}</span>
        </li>
      </ol>
    </div>
    <div v-else class="bg-red-500 text-white border-0 shadow-md rounded-lg p-4">
      Data Tidak Tersedia!.
    </div>
    <!-- Card End -->
  </div>
</template>
