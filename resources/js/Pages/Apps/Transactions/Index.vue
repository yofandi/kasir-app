<script setup>
import { ref, watch, nextTick } from 'vue'
import { Head } from '@inertiajs/inertia-vue3'
//import inerita adapter
import { Inertia } from '@inertiajs/inertia'
import Swal from 'sweetalert2'

import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'

// Import VueMultiselect
import VueMultiselect from 'vue-multiselect'
import 'vue-multiselect/dist/vue-multiselect.css'

import axios from 'axios'
import { route } from 'ziggy-js'

// Define props
const props = defineProps({
  auth: Object,
  customers: Array,
  carts: Array,
  carts_total: Number,
  session: Object,
})

// Reactive state
const customer_id = ref([])
const pageTitle = ref('Transaction')
const barcode = ref('')
const qty = ref(1)
const product = ref({})
const isSearching = ref(false)
const barcodeInputRef = ref(null)

//define state "cash", "change" dan "discount"
const cash = ref(0)
const change = ref(0)
const discount = ref(0)

// nilai tampilan (string)
const discountDisplay = ref('')
const cashDisplay = ref('')

const formatNumber = (value) => {
  if (!value) return ''
  return new Intl.NumberFormat('id-ID').format(value)
}

const searchProduct = async () => {
  if (!barcode.value) {
    product.value = {}
    return
  }

  isSearching.value = true

  try {
    const response = await axios.post(route('apps.transactions.searchProduct'), {
      barcode: barcode.value,
    })

    if (response.data.success) {
      product.value = response.data.data
    } else {
      product.value = {}
    }
  } catch (error) {
    console.error(error)
    product.value = {}
  } finally {
    // apapun hasilnya, loading harus mati
    isSearching.value = false
  }
}

watch(isSearching, (val) => {
  if (!val) {
    nextTick(() => barcodeInputRef.value?.focus())
  }
})

watch(discountDisplay, (val) => {
  const numeric = val.replaceAll(/\D/g, '')
  discount.value = Number(numeric || 0)
  discountDisplay.value = formatNumber(discount.value)

  setDiscount()
})

watch(cashDisplay, (val) => {
  const numeric = val.replace(/\D/g, '')
  cash.value = Number(numeric || 0)
  cashDisplay.value = formatNumber(cash.value)

  setChange()
})

const clearSearch = () => {
  barcode.value = ''
  product.value = {}
  qty.value = 1
}

const grandTotal = ref(props.carts_total)

watch(
  () => props.carts_total,
  (newCartsTotal) => {
    grandTotal.value = newCartsTotal
  },
)

const addToCart = () => {
  if (!product.value.id || qty.value < 1) return
  console.log(customer_id.value)

  Inertia.post(
    route('apps.transactions.addToCart'),
    {
      product_id: product.value.id,
      qty: qty.value,
      sell_price: product.value.sell_price,
    },
    {
      onSuccess: () => {
        clearSearch()
        qty.value = 1
        //update state "grandTotal"
        grandTotal.value = props.carts_total

        //set cash to "0"
        cash.value = 0

        //set change to "0"
        change.value = 0
      },
    },
  )
}

const destroyCart = (cart_id) => {
  Inertia.post(route('apps.transactions.destroyCart', { cart_id: cart_id }), {
    onSuccess: () => {
      //update state "grandTotal"
      grandTotal.value = props.carts_total

      //set cash to "0"
      cash.value = 0

      //set change to "0"
      change.value = 0
    },
  })
}

//method "setDiscount"
const setDiscount = () => {
  //set grandTotal
  grandTotal.value = props.carts_total - discount.value

  //set change to "0"
  change.value = 0
}

//method "setChange"
const setChange = () => {
  //set change
  change.value = cash.value - grandTotal.value
}

const storeTransaction = () => {
  let dataEntry = {
    customer_id: customer_id.value ? customer_id.value.id : null,
    discount: discount.value,
    grand_total: grandTotal.value,
    cash: cash.value,
    change: change.value,
  }

  // HTTP request menggunakan axios
  axios
    .post(route('apps.transactions.store'), dataEntry)
    .then((response) => {
      if (response.data.success) {
        const invoice = response.data.invoice

        clearSearch()

        customer_id.value = null
        discount.value = 0
        cash.value = 0
        change.value = 0

        // Modal sukses dengan tombol print
        Swal.fire({
          title: 'Transaksi Berhasil!',
          text: `Invoice: ${invoice}`,
          icon: 'success',
          showCancelButton: true,
          confirmButtonText: 'Print Nota',
          cancelButtonText: 'Tutup',
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
        }).then((result) => {
          if (result.isConfirmed && invoice) {
            // Buka halaman print invoice
            window.open(route('apps.transactions.print', { invoice }), '_blank')
          }

          // Reload halaman setelah modal ditutup
          setTimeout(() => location.reload(), 500)
        })
      }
    })
    .catch((error) => {
      const message = error.response?.data?.message || 'Terjadi kesalahan saat memproses transaksi.'
      Swal.fire({
        title: 'Error!',
        text: message,
        icon: 'error',
      })
    })
}
</script>

<template>
  <Head>
    <title>Transaction</title>
  </Head>
  <BreadcrumbDefault :pageTitle="pageTitle" />
  <div class="min-h-screen bg-black flex flex-col justify-center items-center p-6">
    <!-- Container Utama -->
    <div class="w-full max-w-6xl grid grid-cols-1 md:grid-cols-2 gap-6">
      <!-- =================== LEFT SECTION =================== -->
      <div class="bg-gray-800 p-6 rounded-lg shadow">
        <h2 class="text-xl font-semibold mb-4 text-white">Add Item</h2>
        <!-- Input Barcode -->
        <div class="mb-4">
          <label
            for="barcode-input"
            class="flex items-center gap-2 text-sm font-medium text-white mb-2"
          >
            <span>Scan or Input Barcode</span>

            <!-- Loading Icon -->
            <svg
              v-if="isSearching"
              class="w-4 h-4 animate-spin text-blue-400"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
            >
              <circle
                class="opacity-25"
                cx="12"
                cy="12"
                r="10"
                stroke="currentColor"
                stroke-width="4"
              ></circle>
              <path
                class="opacity-75"
                fill="currentColor"
                d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"
              ></path>
            </svg>
          </label>

          <input
            id="barcode-input"
            type="text"
            placeholder="Scan or Input Barcode"
            class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200 disabled:opacity-50 disabled:cursor-not-allowed"
            :disabled="isSearching"
            v-model="barcode"
            @keyup.enter="searchProduct"
          />
        </div>

        <!-- Product Name -->
        <div class="mb-4">
          <label for="product-name" class="block text-sm font-medium text-white mb-2">
            Product Name
          </label>
          <input
            id="product-name"
            type="text"
            placeholder="Product Name"
            class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200 disabled:opacity-50 disabled:cursor-not-allowed"
            :disabled="isSearching"
            :value="product.title"
            readonly
          />
        </div>

        <!-- Qty -->
        <div class="mb-4">
          <label for="qty-input" class="block text-sm font-medium text-white mb-2">Qty</label>
          <input
            id="qty-input"
            type="number"
            placeholder="Qty"
            class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200"
            v-model="qty"
            min="1"
          />
        </div>
        <!-- Buttons -->
        <div class="flex justify-end gap-3 mt-4">
          <button
            class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded disabled:opacity-50"
            @click.prevent="clearSearch"
            :disabled="!product.id"
          >
            CLEAR
          </button>
          <button
            class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded disabled:opacity-50"
            @click.prevent="addToCart"
            :disabled="!product.id"
          >
            ADD ITEM
          </button>
        </div>
      </div>

      <!-- =================== RIGHT SECTION =================== -->
      <div class="bg-gray-800 p-6 rounded-lg shadow flex flex-col">
        <!-- Cashier & Customer -->
        <div class="flex justify-between items-center pb-3 mb-4 gap-4">
          <!-- Cashier -->
          <div class="flex flex-col flex-1 max-w-xs">
            <label for="cashier-input" class="text-sm font-medium text-white mb-1">Cashier</label>
            <input
              id="cashier-input"
              type="text"
              class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200"
              :value="auth.user.name"
              readonly
            />
          </div>

          <!-- Customer -->
          <div class="flex flex-col flex-1 max-w-xs">
            <label for="customer-select" class="text-sm font-medium text-white mb-1"
              >Customer</label
            >
            <!-- <input
              type="text"
              placeholder="Customer Name"
              class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200"
            /> -->

            <VueMultiselect
              id="customer-select"
              v-model="customer_id"
              label="name"
              track-by="name"
              :options="customers"
              placeholder="Select Customer"
              class="w-full border border-gray-600 rounded-md p-2 bg-black text-white focus:ring focus:ring-blue-200"
            >
            </VueMultiselect>
          </div>
        </div>

        <!-- ===== ALERT SECTION ===== -->
        <div class="mb-4 space-y-2">
          <!-- Error Alert -->
          <div
            v-if="session?.error"
            class="rounded-lg border border-red-500 bg-red-100 px-4 py-3 text-red-700"
          >
            {{ session.error }}
          </div>

          <!-- Success Alert -->
          <div
            v-if="session?.success"
            class="rounded-lg border border-green-500 bg-green-100 px-4 py-3 text-green-700"
          >
            {{ session.success }}
          </div>
        </div>

        <!-- ===== GRAND TOTAL & CHANGE ===== -->
        <div class="border-b-2 border-green-400 pb-3 mb-4 space-y-2">
          <!-- GRAND TOTAL -->
          <div class="flex justify-between items-center">
            <h2 class="text-xl font-semibold text-white">GRAND TOTAL</h2>
            <p class="text-xl font-bold text-white">Rp. {{ formatPrice(grandTotal) }}</p>
          </div>

          <!-- CHANGE -->
          <div v-if="change > 0" class="pt-2 border-t border-green-300">
            <p class="text-green-400 font-semibold text-right">
              Change :
              <span class="font-bold"> Rp. {{ formatPrice(change) }} </span>
            </p>
          </div>
        </div>

        <!-- Table -->
        <div class="overflow-x-auto mb-4">
          <table class="min-w-full border border-gray-600 text-sm">
            <thead class="bg-gray-700 text-white">
              <tr>
                <th class="border border-gray-600 px-3 py-2 text-left w-8">#</th>
                <th class="border border-gray-600 px-3 py-2 text-left">Product Name</th>
                <th class="border border-gray-600 px-3 py-2 text-right w-24">Price</th>
                <th class="border border-gray-600 px-3 py-2 text-center w-16">Qty</th>
                <th class="border border-gray-600 px-3 py-2 text-right w-32">Sub Total</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="cart in carts" :key="cart.id">
                <td class="border border-gray-600 px-3 py-2 text-left">
                  <button
                    @click.prevent="destroyCart(cart.id)"
                    class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded"
                  >
                    Delete
                  </button>
                </td>
                <td class="border border-gray-600 px-3 py-2 text-left">{{ cart.product.title }}</td>
                <td class="border border-gray-600 px-3 py-2 text-right">
                  {{ formatPrice(cart.product.sell_price) }}
                </td>
                <td class="border border-gray-600 px-3 py-2 text-center">{{ cart.qty }}</td>
                <td class="border border-gray-600 px-3 py-2 text-right">
                  {{ formatPrice(cart.price) }}
                </td>
              </tr>
              <tr>
                <td class="border border-gray-600 px-3 py-2 text-left w-8">TOTAL</td>
                <td colspan="4" class="border border-gray-600 px-3 py-2 text-right font-bold">
                  Rp. {{ formatPrice(carts_total) }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Discount & Pay -->
        <div class="flex flex-col gap-3 mb-4">
          <div>
            <label for="discount-input" class="block text-sm font-medium text-white mb-1">
              Discount (Rp.)
            </label>
            <input
              id="discount-input"
              type="text"
              v-model="discountDisplay"
              @keyup="setDiscount"
              placeholder="Discount (Rp.)"
              class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200"
            />
          </div>
          <div>
            <label for="pay-input" class="block text-sm font-medium text-white mb-1">
              Pay (Rp.)
            </label>
            <input
              id="pay-input"
              type="text"
              v-model="cashDisplay"
              @keyup="setChange"
              placeholder="Pay (Rp.)"
              class="w-full border border-gray-600 rounded-md p-2 bg-gray-700 text-white focus:ring focus:ring-blue-200"
            />
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="flex justify-end gap-3 mt-auto">
          <button class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded">
            CANCEL
          </button>
          <button
            @click.prevent="storeTransaction"
            class="bg-purple-600 hover:bg-purple-700 text-white px-4 py-2 rounded"
            :disabled="cash < grandTotal || grandTotal == 0"
          >
            PAY ORDER & PRINT
          </button>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="mt-8 text-sm text-gray-500"></footer>
  </div>
</template>

<style scoped>
/* Tidak wajib, semua styling sudah dari Tailwind */
</style>
