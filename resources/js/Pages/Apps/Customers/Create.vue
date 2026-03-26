<script setup>
import { ref, computed } from 'vue'
import { Head, usePage } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'
import Swal from 'sweetalert2'

// import komponen layout dan partial
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DefaultCard from '../../../Components/Forms/DefaultCard.vue'
import InputGroup from '../../../Components/Forms/InputGroup.vue'

// === Ambil error dari Laravel ===
const page = usePage()
const errors = computed(() => page.props.errors || {})

// === STATE FORM ===
const form = ref({
  name: '',
  no_telp: '',
  address: '',
})

function handleSubmit() {
  Inertia.post(route('apps.customers.store'), form.value, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'Customer created successfully.',
        icon: 'success',
        showConfirmButton: false,
        timer: 2000,
      })

      // reset form setelah sukses
      form.value = { name: '', no_telp: '', address: '' }
    },
    onError: (errors) => {
      Swal.fire({
        title: 'Error!',
        text: 'Please check the form fields.',
        icon: 'error',
        confirmButtonColor: '#3056D3',
      })
    },
  })
}

// === METHOD RESET ===
function handleReset() {
  form.value = { name: '', no_telp: '', address: '' }
}
</script>

<template>
  <Head title="Create Customer" />

  <BreadcrumbDefault :pageTitle="'Create Customer'" />

  <DefaultCard cardTitle="Add Customer" class="shadow-md">
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
            SAVE
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
  </DefaultCard>
</template>
