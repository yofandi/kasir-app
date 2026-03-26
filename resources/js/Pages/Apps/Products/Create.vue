<script setup>
import { ref, computed } from 'vue'
import { Head, usePage } from '@inertiajs/inertia-vue3'
import { Inertia } from '@inertiajs/inertia'
import Swal from 'sweetalert2'

// import komponen layout dan partial
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DefaultCard from '../../../Components/Forms/DefaultCard.vue'
import InputGroup from '../../../Components/Forms/InputGroup.vue'

// === Ambil props Laravel ===
const page = usePage()
const categories = ref(page.props.value.categories || [])

// === Ambil error dari Laravel ===
const errors = computed(() => page.props.errors || {})

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

  Inertia.post('/apps/products', formData, {
    onSuccess: () => {
      Swal.fire({
        title: 'Success!',
        text: 'Product created successfully.',
        icon: 'success',
        showConfirmButton: false,
        timer: 2000,
      })

      // reset form setelah sukses
      form.value = {
        image: null,
        barcode: '',
        title: '',
        description: '',
        category_id: '',
        buy_price: '',
        sell_price: '',
        stock: '',
      }
      imagePreview.value = null
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
  form.value = {
    image: null,
    barcode: '',
    title: '',
    description: '',
    category_id: '',
    buy_price: '',
    sell_price: '',
    stock: '',
  }
  imagePreview.value = null
}
</script>

<template>
  <Head title="Create Product" />

  <BreadcrumbDefault :pageTitle="'Create Product'" />

  <DefaultCard cardTitle="Add Product" class="shadow-md">
    <form @submit.prevent="handleSubmit">
      <div class="p-6 space-y-6">
        <!-- Grid untuk input fields -->
        <!-- Image Upload -->
        <div>
          <label class="mb-2.5 block text-black dark:text-white">
            Product Image <span class="text-meta-1">*</span>
          </label>
          <div class="flex items-center space-x-4">
            <input
              type="file"
              @change="handleImageChange"
              accept="image/*"
              class="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-normal outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
            />
            <div v-if="imagePreview" class="w-20 h-20 border rounded">
              <img :src="imagePreview" alt="Preview" class="w-full h-full object-cover rounded" />
            </div>
          </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
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
