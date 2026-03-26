import './bootstrap'
import '../css/app.css'
import './assets/css/satoshi.css'
import './assets/css/style.css'
import 'jsvectormap/dist/jsvectormap.css'
import 'flatpickr/dist/flatpickr.min.css'

import { createInertiaApp } from '@inertiajs/inertia-vue3'
import { createPinia } from 'pinia'
import { createApp, h } from 'vue'
import VueApexCharts from 'vue3-apexcharts'

import { ZiggyVue } from '../../vendor/tightenco/ziggy/dist/index.esm.js'
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers'
import { InertiaProgress } from '@inertiajs/progress'

import DefaultLayout from './layouts/DefaultLayout.vue'

const appName = window.document.getElementsByTagName('title')[0]?.innerText || 'Laravel'

createInertiaApp({
  title: (title) => title + ' - ' + appName,

  resolve: async (name) => {
    let page = (
      await resolvePageComponent('./Pages/' + name + '.vue', import.meta.glob('./Pages/**/*.vue'))
    ).default

    if (page.layout === undefined) {
      page.layout = DefaultLayout
    }

    return page
  },

  setup({ el, App, props, plugin }) {
    const app = createApp({ render: () => h(App, props) })

    // method hasAnyPermission yang akan didaftarkan secara global
    // Fungsi hasAnyPermission: digunakan untuk mengecek apakah user memiliki minimal satu dari permission yang diberikanl
    function hasAnyPermission(permissions) {
      // Validasi agar hanya menerima array, bukan string atau object
      if (!Array.isArray(permissions)) {
        console.error('Parameter permissions harus berupa array.')
        return false
      }

      // Ambil daftar semua permission user dari props auth yang dikirim oleh backend (Laravel)
      let allPermissions = app.config.globalProperties.$page.props.auth.permissions || {}

      // Cek apakah ada minimal satu permission dari daftar yang dimiliki user
      return permissions.some((item) => allPermissions[item])
    }

    function formatPrice(value) {
      let val = (value / 1).toFixed(0).replace('.', ',')
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')
    }

    // daftarkan method hasAnyPermission ke globalProperties
    // Menambahkan method ke globalProperties agar bisa diakses dari setup() component via instance
    app.config.globalProperties.hasAnyPermission = hasAnyPermission // Menambahkan method ke mixin agar bisa diakses langsung via `this.hasAnyPermission` di template/script biasa // set mixins
    app.config.globalProperties.formatPrice = formatPrice

    app.mixin({
      methods: {
        hasAnyPermission,
        formatPrice,
      },
    })

    // === Tambahkan ini untuk mengecek ===
    if (app.config.globalProperties.hasAnyPermission) {
      console.log('hasAnyPermission mixin berhasil ditambahkan secara global.')
      //   console.log(app.config.globalProperties.hasAnyPermission)
    } else {
      console.error('ERROR: hasAnyPermission mixin TIDAK ditemukan secara global!')
    }
    // ===================================
    app.use(plugin)
    app.use(createPinia())
    app.use(VueApexCharts)
    app.use(ZiggyVue, props.ziggy)
    app.mount(el)
  },
})

InertiaProgress.init({
  delay: 100,
  color: '#696cff',
  showSpinner: true,
})
