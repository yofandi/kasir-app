<script setup>
import { ref, computed } from 'vue'
import { Head, usePage } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'
import Swal from 'sweetalert2'

// import komponen layout dan partial
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DefaultCard from '../../../Components/Forms/DefaultCard.vue'
import InputGroup from '../../../Components/Forms/InputGroup.vue'
import CheckboxTwo from '../../../Components/Forms/Checkboxes/CheckboxTwo.vue'

// === Ambil props Laravel ===
const page = usePage()
const roles = ref(page.props.value.roles || [])

// === Ambil error dari Laravel ===
const errors = computed(() => page.props.errors || {})

// === STATE FORM ===
const form = ref({
  name: '',
  email: '',
  password: '',
  password_confirmation: '',
  roles: [],
})

function handleSubmit() {
  Inertia.post('/apps/users', form.value, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'User created successfully.',
        icon: 'success',
        showConfirmButton: false,
        timer: 2000,
      })

      // reset form setelah sukses
      form.value = { name: '', email: '', password: '', password_confirmation: '', roles: [] }
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
  form.value = { name: '', email: '', password: '', password_confirmation: '', roles: [] }
}
</script>

<template>
  <Head title="Create User" />

  <BreadcrumbDefault :pageTitle="'Create User'" />

  <DefaultCard cardTitle="Add User" class="shadow-md">
    <form @submit.prevent="handleSubmit">
      <div class="p-6 space-y-6">
        <!-- Grid untuk input fields -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <!-- Full Name -->
          <InputGroup
            label="Full Name"
            v-model="form.name"
            placeholder="Enter Full Name"
            customClasses="mb-4.5"
            required
          />

          <!-- Email -->
          <InputGroup
            label="Email"
            type="email"
            v-model="form.email"
            placeholder="Enter Email"
            customClasses="mb-4.5"
            required
          />

          <!-- Password -->
          <InputGroup
            label="Password"
            type="password"
            v-model="form.password"
            placeholder="Enter Password"
            customClasses="mb-4.5"
            required
          />

          <!-- Password Confirmation -->
          <InputGroup
            label="Password Confirmation"
            type="password"
            v-model="form.password_confirmation"
            placeholder="Confirm Password"
            customClasses="mb-4.5"
            required
          />
        </div>

        <!-- Roles -->
        <div>
          <label class="block mb-2 text-sm font-medium text-gray-700 dark:text-gray-300">
            Roles
          </label>
          <div
            class="flex flex-wrap gap-x-4 gap-y-3 border border-gray-200 dark:border-gray-700 rounded-lg p-4"
          >
            <CheckboxTwo
              v-for="(role, i) in roles"
              :key="i"
              v-model="form.roles"
              :value="role.name"
              :label="role.name"
            />
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
