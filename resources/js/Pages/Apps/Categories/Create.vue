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
  description: '',
  image: null,
})

function handleSubmit() {
  const formData = new FormData()
  formData.append('name', form.value.name)
  formData.append('description', form.value.description)
  if (form.value.image) {
    formData.append('image', form.value.image)
  }

  Inertia.post(route('apps.categories.store'), formData, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'Category created successfully.',
        icon: 'success',
        showConfirmButton: false,
        timer: 2000,
      })

      // reset form setelah sukses
      form.value = { name: '', description: '', image: null }
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
  form.value = { name: '', description: '', image: null }
}

// Handle file input
function handleFileChange(event) {
  form.value.image = event.target.files[0]
}
</script>

<template>
  <Head title="Create Category" />

  <BreadcrumbDefault :pageTitle="'Create Category'" />

  <DefaultCard cardTitle="Add Category" class="shadow-md">
    <form @submit.prevent="handleSubmit">
      <div class="p-6 space-y-6">
        <!-- Grid untuk input fields -->
        <div>
          <!-- Image Upload -->
          <div>
            <label class="mb-3 block text-sm font-medium text-black dark:text-white">
              Attach file
            </label>
            <input
              type="file"
              @change="handleFileChange"
              class="w-full cursor-pointer rounded-lg border-[1.5px] border-stroke bg-transparent font-medium outline-none transition file:mr-5 file:border-collapse file:cursor-pointer file:border-0 file:border-r file:border-solid file:border-stroke file:bg-whiter file:py-3 file:px-5 file:hover:bg-primary file:hover:bg-opacity-10 focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-form-strokedark dark:file:bg-white/30 dark:file:text-white dark:focus:border-primary"
              required
            />
          </div>

          <!-- Name -->
          <InputGroup
            label="Name"
            v-model="form.name"
            placeholder="Enter Category Name"
            customClasses="mb-4.5"
            required
          />
        </div>

        <!-- Description -->
        <div>
          <label class="mb-3 block text-sm font-medium text-black dark:text-white">
            Default textarea
          </label>
          <textarea
            rows="6"
            placeholder="Default textarea"
            v-model="form.description"
            class="w-full rounded-lg border-[1.5px] text-black border-stroke bg-transparent py-3 px-5 font-normal outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:text-white dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
            required
          ></textarea>
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
