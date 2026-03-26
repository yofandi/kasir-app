<script setup lang="ts">
import DefaultAuthCard from '../../components/Auths/DefaultAuthCard.vue'
import InputGroup from '../../components/Auths/InputGroup.vue'

// BreadcrumbDefault dan pageTitle tidak lagi diperlukan karena layout: null
// import BreadcrumbDefault dari '../../components/Breadcrumbs/BreadcrumbDefault.vue'

import { Head, Link, useForm, usePage } from '@inertiajs/inertia-vue3' // Import Head dan Link

// Menggunakan defineOptions untuk mendeklarasikan opsi komponen seperti 'layout'
// Ini adalah cara yang disarankan saat menggunakan <script setup>
defineOptions({
  layout: null, // Memastikan halaman ini tidak menggunakan layout default
})

// Mendefinisikan props yang diterima dari controller Laravel
// errors: Objek yang berisi pesan error validasi (key-value pair)
// session: Objek yang berisi flash messages (misalnya status sukses)
const props = defineProps<{
  errors: Record<string, string>
  session: { status?: string }
  route: Object
}>()

// Mengakses shared props dari Inertia melalui usePage()
const page = usePage()
const appName = page.props.app_name // Mengambil nilai app_name

// Menginisialisasi form state menggunakan useForm dari Inertia
// Ini menyediakan properti reaktif untuk input form (email, password)
const form = useForm({
  email: '',
  password: '',
  password_confirmation: '',
  token: props.route.params.token,
})

// Metode untuk mengirimkan form reset password

const submit = () => {
  // Mengirim data form ke endpoint '/reset-password' menggunakan metode POST Inertia

  form.post('/reset-password', {
    // Callback yang dijalankan setelah request selesai (baik sukses atau gagal)
    // onFinish: () => form.reset('email'), // Mereset field email untuk keamanan
  })
}
</script>

<template>
  <!-- Mengatur judul halaman untuk tab browser atau SEO -->

  <Head>
    <title>Reset Password {{ appName }}</title>
  </Head>

  <!-- Container utama yang memposisikan konten form di tengah layar -->

  <div class="flex items-center justify-center min-h-screen bg-gray-100 dark:bg-boxdark">
    <!-- DefaultAuthCard berfungsi sebagai wrapper visual untuk form reset password -->

    <DefaultAuthCard subtitle="Start for free" title="Reset Password">
      <!-- Menampilkan pesan status dari session (misalnya, setelah reset password) -->

      <div
        v-if="props.session.status"
        class="mb-4 p-3 rounded-lg bg-green-100 text-green-700 text-sm"
      >
        {{ props.session.status }}
      </div>

      <!-- Form forgot password -->

      <form @submit.prevent="submit">
        <!-- Input untuk Email -->

        <!-- v-model mengikat nilai input ke form.email -->

        <!-- :error meneruskan pesan error validasi ke komponen InputGroup -->

        <InputGroup
          label="Email"
          type="email"
          placeholder="Enter your email"
          v-model="form.email"
          :error="props.errors.email"
        >
          <!-- SVG Icon untuk Email -->

          <svg
            class="fill-current"
            width="22"
            height="22"
            viewBox="0 0 22 22"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <g opacity="0.5">
              <path
                d="M19.2516 3.30005H2.75156C1.58281 3.30005 0.585938 4.26255 0.585938 5.46567V16.6032C0.585938 17.7719 1.54844 18.7688 2.75156 18.7688H19.2516C20.4203 18.7688 21.4172 17.8063 21.4172 16.6032V5.4313C21.4172 4.26255 20.4203 3.30005 19.2516 3.30005ZM19.2516 4.84692C19.2859 4.84692 19.3203 4.84692 19.3547 4.84692L11.0016 10.2094L2.64844 4.84692C2.68281 4.84692 2.71719 4.84692 2.75156 4.84692H19.2516ZM19.2516 17.1532H2.75156C2.40781 17.1532 2.13281 16.8782 2.13281 16.5344V6.35942L10.1766 11.5157C10.4172 11.6875 10.6922 11.7563 10.9672 11.7563C11.2422 11.7563 11.5172 11.6875 11.7578 11.5157L19.8016 6.35942V16.5688C19.8703 16.9125 19.5953 17.1532 19.2516 17.1532Z"
                fill=""
              />
            </g>
          </svg>
        </InputGroup>
        <InputGroup
          label="Password"
          type="password"
          placeholder="new password"
          v-model="form.password"
          :error="props.errors.password"
        >
          <!-- SVG Icon untuk Password -->
          <svg
            class="fill-current"
            width="22"
            height="22"
            viewBox="0 0 22 22"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <g opacity="0.5">
              <path
                d="M16.1547 6.80626V5.91251C16.1547 3.16251 14.0922 0.825009 11.4797 0.618759C10.0359 0.481259 8.59219 0.996884 7.52656 1.95938C6.46094 2.92188 5.84219 4.29688 5.84219 5.70626V6.80626C3.84844 7.18438 2.33594 8.93751 2.33594 11.0688V17.2906C2.33594 19.5594 4.19219 21.3813 6.42656 21.3813H15.5016C17.7703 21.3813 19.6266 19.525 19.6266 17.2563V11C19.6609 8.93751 18.1484 7.21876 16.1547 6.80626ZM8.55781 3.09376C9.31406 2.40626 10.3109 2.06251 11.3422 2.16563C13.1641 2.33751 14.6078 3.98751 14.6078 5.91251V6.70313H7.38906V5.67188C7.38906 4.70938 7.80156 3.78126 8.55781 3.09376ZM18.1141 17.2906C18.1141 18.7 16.9453 19.8688 15.5359 19.8688H6.46094C5.05156 19.8688 3.91719 18.7344 3.91719 17.325V11.0688C3.91719 9.52189 5.15469 8.28438 6.70156 8.28438H15.2953C16.8422 8.28438 18.1141 9.52188 18.1141 11V17.2906Z"
                fill=""
              />
              <path
                d="M10.9977 11.8594C10.5852 11.8594 10.207 12.2031 10.207 12.65V16.2594C10.207 16.6719 10.5508 17.05 10.9977 17.05C11.4102 17.05 11.7883 16.7063 11.7883 16.2594V12.6156C11.7883 12.2031 11.4102 11.8594 10.9977 11.8594Z"
                fill=""
              />
            </g>
          </svg>
        </InputGroup>
        <InputGroup
          label="Password Confirmation"
          type="password"
          placeholder="password confirmation"
          v-model="form.password_confirmation"
          :error="props.errors.password_confirmation"
        >
          <!-- SVG Icon untuk Password -->
          <svg
            class="fill-current"
            width="22"
            height="22"
            viewBox="0 0 22 22"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <g opacity="0.5">
              <path
                d="M16.1547 6.80626V5.91251C16.1547 3.16251 14.0922 0.825009 11.4797 0.618759C10.0359 0.481259 8.59219 0.996884 7.52656 1.95938C6.46094 2.92188 5.84219 4.29688 5.84219 5.70626V6.80626C3.84844 7.18438 2.33594 8.93751 2.33594 11.0688V17.2906C2.33594 19.5594 4.19219 21.3813 6.42656 21.3813H15.5016C17.7703 21.3813 19.6266 19.525 19.6266 17.2563V11C19.6609 8.93751 18.1484 7.21876 16.1547 6.80626ZM8.55781 3.09376C9.31406 2.40626 10.3109 2.06251 11.3422 2.16563C13.1641 2.33751 14.6078 3.98751 14.6078 5.91251V6.70313H7.38906V5.67188C7.38906 4.70938 7.80156 3.78126 8.55781 3.09376ZM18.1141 17.2906C18.1141 18.7 16.9453 19.8688 15.5359 19.8688H6.46094C5.05156 19.8688 3.91719 18.7344 3.91719 17.325V11.0688C3.91719 9.52189 5.15469 8.28438 6.70156 8.28438H15.2953C16.8422 8.28438 18.1141 9.52188 18.1141 11V17.2906Z"
                fill=""
              />
              <path
                d="M10.9977 11.8594C10.5852 11.8594 10.207 12.2031 10.207 12.65V16.2594C10.207 16.6719 10.5508 17.05 10.9977 17.05C11.4102 17.05 11.7883 16.7063 11.7883 16.2594V12.6156C11.7883 12.2031 11.4102 11.8594 10.9977 11.8594Z"
                fill=""
              />
            </g>
          </svg>
        </InputGroup>
        <!-- Tombol UPDATE PASSWORD -->

        <div class="mb-5">
          <button
            type="submit"
            class="w-full cursor-pointer rounded-lg border border-primary bg-primary p-4 font-medium text-white transition hover:bg-opacity-90"
            :disabled="form.processing"
          >
            {{ form.processing ? 'UPDATE PASSWORD...' : 'UPDATE PASSWORD' }}
          </button>
        </div>
      </form>
    </DefaultAuthCard>
  </div>
</template>
