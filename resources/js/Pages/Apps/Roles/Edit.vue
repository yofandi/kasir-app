<script setup>
import { ref, onMounted } from 'vue'
import { Head, usePage } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'

// import komponen layout dan partial
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DefaultCard from '../../../Components/Forms/DefaultCard.vue'
import InputGroup from '../../../Components/Forms/InputGroup.vue'
import CheckboxTwo from '../../../Components/Forms/Checkboxes/CheckboxTwo.vue'

// import sweetalert2
import Swal from 'sweetalert2'

// === Akses props dari Laravel melalui usePage() ===
const page = usePage()
const role = ref(page.props.value.role || {})
const permissions = ref(page.props.value.permissions || [])

// === STATE FORM ===
const form = ref({
  name: '',
  permissions: [],
})

// === LIFECYCLE ===
onMounted(() => {
  // Isi form dengan data role yang ada
  form.value.name = role.value.name || ''
  form.value.permissions = role.value.permissions ? role.value.permissions.map((p) => p.name) : []
})

// === METHOD SUBMIT ===
function handleSubmit() {
  //   Inertia.put(`/apps/roles/${role.value.id}`, form.value, {
  Inertia.put(route('apps.roles.update', role.value.id), form.value, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'Role updated successfully.',
        icon: 'success',
        showConfirmButton: false,
        timer: 2000,
      })
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
  // Reset ke nilai awal
  form.value.name = role.value.name || ''
  form.value.permissions = role.value.permissions ? role.value.permissions.map((p) => p.name) : []
}
</script>

<template>
  <Head title="Edit Role" />

  <BreadcrumbDefault :pageTitle="'Edit Role'" />

  <DefaultCard cardTitle="Edit Role" class="shadow-md">
    <form @submit.prevent="handleSubmit">
      <div class="p-6 space-y-6">
        <!-- Role Name -->
        <InputGroup
          label="Role Name"
          v-model="form.name"
          placeholder="Enter Role Name"
          customClasses="mb-4.5"
          required
        />

        <!-- Permissions -->
        <div>
          <label class="block mb-2 text-sm font-medium text-gray-700 dark:text-gray-300">
            Permissions
          </label>
          <div
            class="flex flex-wrap gap-x-4 gap-y-3 border border-gray-200 dark:border-gray-700 rounded-lg p-4"
          >
            <CheckboxTwo
              v-for="(perm, i) in permissions"
              :key="i"
              v-model="form.permissions"
              :value="perm.name"
              :label="perm.name"
            />
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
  </DefaultCard>
</template>
