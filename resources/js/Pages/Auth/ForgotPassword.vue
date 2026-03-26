<script setup lang="ts">
import DefaultAuthCard from '../../components/Auths/DefaultAuthCard.vue'

import InputGroup from '../../components/Auths/InputGroup.vue'

// BreadcrumbDefault dan pageTitle tidak lagi diperlukan karena layout: null

// import BreadcrumbDefault dari '../../components/Breadcrumbs/BreadcrumbDefault.vue'

import { Head, Link, useForm } from '@inertiajs/inertia-vue3' // Import Head dan Link

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
}>()

// Menginisialisasi form state menggunakan useForm dari Inertia

// Ini menyediakan properti reaktif untuk input form (email, password)

const form = useForm({
  email: '',
})

// Metode untuk mengirimkan form forgot password

const submit = () => {
  // Mengirim data form ke endpoint '/forgot-password' menggunakan metode POST Inertia

  form.post('/forgot-password', {
    // Callback yang dijalankan setelah request selesai (baik sukses atau gagal)
    // onFinish: () => form.reset('email'), // Mereset field email untuk keamanan
  })
}
</script>

<template>
  <!-- Mengatur judul halaman untuk tab browser atau SEO -->

  <Head>
    <title>Forgot Password - Aplikasi Kasir</title>
  </Head>

  <!-- Container utama yang memposisikan konten form di tengah layar -->

  <div class="flex items-center justify-center min-h-screen bg-gray-100 dark:bg-boxdark">
    <!-- DefaultAuthCard berfungsi sebagai wrapper visual untuk form forgot password -->

    <DefaultAuthCard subtitle="Start for free" title="Forgot Password">
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

        <!-- Tombol SEND PASSWORD RESET LINK -->

        <div class="mb-5">
          <button
            type="submit"
            class="w-full cursor-pointer rounded-lg border border-primary bg-primary p-4 font-medium text-white transition hover:bg-opacity-90"
            :disabled="form.processing"
          >
            {{ form.processing ? 'SEND PASSWORD RESET LINK...' : 'SEND PASSWORD RESET LINK' }}
          </button>
        </div>
      </form>
    </DefaultAuthCard>
  </div>
</template>
