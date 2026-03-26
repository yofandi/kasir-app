<script setup>
import { ref, computed, onMounted } from 'vue'
import { Head, usePage } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'
import Swal from 'sweetalert2'

// import komponen layout dan partial
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DefaultCard from '../../../Components/Forms/DefaultCard.vue'
import InputGroup from '../../../Components/Forms/InputGroup.vue'

// === Ambil props Laravel ===
const page = usePage()
const product = ref(page.props.value.product || {})
const categories = ref(page.props.value.categories || [])

// === STATE FORM ===
const form = ref({
  image: null,
  barcode: '',
  title: '',
  description: '',
  category_id: '',
  buy_price: '',
  sell_price: '',
  stock: '',
})

const imagePreview = ref(null)

// === LIFECYCLE ===
onMounted(() => {
  // Isi form dengan data product yang ada
  form.value.barcode = product.value.barcode || ''
  form.value.title = product.value.title || ''
  form.value.description = product.value.description || ''
  form.value.category_id = product.value.category_id || ''
  form.value.buy_price = product.value.buy_price || ''
  form.value.sell_price = product.value.sell_price || ''
  form.value.stock = product.value.stock || ''

  // Set image preview jika ada
  if (product.value.image) {
    imagePreview.value = `/storage/products/${product.value.image}`
  }
})

function handleImageChange(event) {
  const file = event.target.files[0]
  if (file) {
    form.value.image = file
    const reader = new FileReader()
    reader.onload = (e) => {
      imagePreview.value = e.target.result
    }
    reader.readAsDataURL(file)
  }
}

function handleSubmit() {
  const formData = new FormData()

  // Append all form fields
  Object.keys(form.value).forEach((key) => {
    if (form.value[key] !== null && form.value[key] !== '') {
      formData.append(key, form.value[key])
    }
  })

  // Append method for Laravel (PUT request)
  formData.append('_method', 'PUT')

  Inertia.post(route('apps.products.update', product.value.id), formData, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'Product updated successfully.',
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
  form.value.barcode = product.value.barcode || ''
  form.value.title = product.value.title || ''
  form.value.description = product.value.description || ''
  form.value.category_id = product.value.category_id || ''
  form.value.buy_price = product.value.buy_price || ''
  form.value.sell_price = product.value.sell_price || ''
  form.value.stock = product.value.stock || ''
  form.value.image = null

  // Reset image preview
  if (product.value.image) {
    imagePreview.value = `/storage/products/${product.value.image}`
  } else {
    imagePreview.value = null
  }
}
</script>

<template>
  <Head title="Edit Product" />

  <BreadcrumbDefault :pageTitle="'Edit Product'" />

  <DefaultCard cardTitle="Edit Product" class="shadow-md">
    <form @submit.prevent="handleSubmit">
      <div class="p-6 space-y-6">
        <!-- Grid untuk input fields -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <!-- Current Image Preview -->
          <div class="mb-4">
            <label class="mb-3 block text-sm font-medium text-black dark:text-white">
              Current Image
            </label>
            <img
              :src="product.image"
              alt="Current Product Image"
              class="w-32 h-32 object-cover rounded-lg border"
            />
          </div>

          <!-- Image Upload -->
          <div>
            <label class="mb-3 block text-sm font-medium text-black dark:text-white">
              Attach new file (optional)
            </label>
            <input
              type="file"
              @change="handleImageChange"
              accept="image/*"
              class="w-full cursor-pointer rounded-lg border-[1.5px] border-stroke bg-transparent font-medium outline-none transition file:mr-5 file:border-collapse file:cursor-pointer file:border-0 file:border-r file:border-solid file:border-stroke file:bg-whiter file:py-3 file:px-5 file:hover:bg-primary file:hover:bg-opacity-10 focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-form-strokedark dark:file:bg-white/30 dark:file:text-white dark:focus:border-primary"
            />
          </div>

          <!-- Barcode -->
          <InputGroup
            label="Barcode"
            v-model="form.barcode"
            placeholder="Enter Product Barcode"
            customClasses="mb-4.5"
            required
          />

          <!-- Title -->
          <InputGroup
            label="Product Title"
            v-model="form.title"
            placeholder="Enter Product Title"
            customClasses="mb-4.5"
            required
          />

          <!-- Category -->
          <div class="mb-4.5">
            <label class="mb-2.5 block text-black dark:text-white">
              Category <span class="text-meta-1">*</span>
            </label>
            <select
              v-model="form.category_id"
              class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-normal outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:text-white dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
            >
              <option value="">Select Category</option>
              <option v-for="category in categories" :key="category.id" :value="category.id">
                {{ category.name }}
              </option>
            </select>
          </div>

          <!-- Buy Price -->
          <InputGroup
            label="Buy Price"
            type="number"
            v-model="form.buy_price"
            placeholder="Enter Buy Price"
            customClasses="mb-4.5"
            required
          />

          <!-- Sell Price -->
          <InputGroup
            label="Sell Price"
            type="number"
            v-model="form.sell_price"
            placeholder="Enter Sell Price"
            customClasses="mb-4.5"
            required
          />

          <!-- Stock -->
          <InputGroup
            label="Stock"
            type="number"
            v-model="form.stock"
            placeholder="Enter Stock Quantity"
            customClasses="mb-4.5"
            required
          />
        </div>

        <!-- Description -->
        <div class="mb-4.5">
          <label class="mb-2.5 block text-black dark:text-white">
            Description <span class="text-meta-1">*</span>
          </label>
          <textarea
            v-model="form.description"
            placeholder="Enter Product Description"
            rows="4"
            class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-normal outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:text-white dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
          ></textarea>
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
