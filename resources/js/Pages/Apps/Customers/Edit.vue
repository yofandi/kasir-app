<script setup>
import { ref, watch } from 'vue'
import { Head, usePage } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'
import Swal from 'sweetalert2'

import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DefaultCard from '../../../Components/Forms/DefaultCard.vue'
import InputGroup from '../../../Components/Forms/InputGroup.vue'

// === Ambil props dari Laravel ===
const page = usePage()
const customer = ref(page.props.value.customer || {})

// === STATE FORM ===
const form = ref({
  name: '',
  no_telp: '',
  address: '',
})

// === Flag agar sinkronisasi hanya sekali ===
const initialized = ref(false)

// === Sinkronisasi form hanya sekali ketika customer sudah ada ===
watch(
  () => customer.value,
  (c) => {
    if (c && !initialized.value) {
      form.value = {
        name: c.name || '',
        no_telp: c.no_telp || '',
        address: c.address || '',
      }
      initialized.value = true
    }
  },
  { immediate: true },
)

// === Fungsi Submit ===
function handleSubmit() {
  Inertia.put(route('apps.customers.update', customer.value.id), form.value, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'Customer updated successfully.',
        icon: 'success',
        showConfirmButton: false,
        timer: 2000,
      })
    },
    onError: () => {
      Swal.fire({
        title: 'Error!',
        text: 'Please check the form fields.',
        icon: 'error',
        confirmButtonColor: '#3056D3',
      })
    },
  })
}

// === Fungsi Reset ===
function handleReset() {
  form.value = { name: '', no_telp: '', address: '' }
}
</script>

<template>
  <Head title="Edit Customer" />

  <BreadcrumbDefault :pageTitle="'Edit Customer'" />

  <div
    class="rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1 overflow-x-auto"
  >
    <h2 class="text-white font-semibold text-lg mb-4">Edit Customer</h2>

    <form @submit.prevent="handleSubmit">
      <div class="p-6 space-y-6">
        <!-- Grid untuk input fields -->
        <div>
          <!-- Name -->
          <InputGroup
            label="Full Name"
            v-model="form.name"
            placeholder="Enter Customer Full Name"
            customClasses="mb-4.5"
            required
          />

          <!-- No. Telp -->
          <InputGroup
            label="No. Telp"
            v-model="form.no_telp"
            placeholder="Enter Phone Number"
            customClasses="mb-4.5"
            required
          />

          <!-- Address -->
          <div>
            <label class="mb-3 block text-sm font-medium text-black dark:text-white">
              Address
            </label>
            <textarea
              rows="4"
              placeholder="Enter Customer Address"
              v-model="form.address"
              class="w-full rounded-lg border-[1.5px] text-black border-stroke bg-transparent py-3 px-5 font-normal outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:text-white dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
              required
            ></textarea>
          </div>
        </div>

        <!-- Buttons -->
        <div class="flex gap-4 justify-end mt-6">
          <button
            type="submit"
            class="bg-primary hover:bg-indigo-700 text-white font-medium py-2 px-6 rounded shadow transition-all"
          >
            UPDATE
          </button>
          <button
            type="button"
            @click="handleReset"
            class="bg-yellow-500 hover:bg-yellow-600 text-white font-medium py-2 px-6 rounded shadow transition-all"
          >
            RESET
          </button>
        </div>
      </div>
    </form>
  </div>
</template>
