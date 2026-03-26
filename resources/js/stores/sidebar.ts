import { useStorage } from '@vueuse/core' // Mengimpor useStorage dari @vueuse/core untuk menyimpan data ke localStorage secara reaktif
import { defineStore } from 'pinia' // Mengimpor defineStore dari Pinia untuk mendefinisikan store
import { ref } from 'vue' // Mengimpor ref dari Vue untuk membuat data reaktif

// Mendefinisikan store dengan nama 'sidebar'
export const useSidebarStore = defineStore('sidebar', () => {
  const isSidebarOpen = ref(false) // State reaktif untuk menyimpan status apakah sidebar terbuka atau tidak

  /**
   * Menyimpan nilai menu yang sedang dipilih.
   * Nilai default: 'Home'
   * Menggunakan useStorage agar nilai ini bertahan di localStorage meskipun halaman di-refresh.
   */
  const selected = useStorage('selected', ref('Home'))

  /**
   * Menyimpan nama halaman aktif.
   * Nilai default: 'Dashboard'
   * Juga disimpan di localStorage menggunakan useStorage.
   */
  const page = useStorage('page', ref('Dashboard'))

  /**
   * Fungsi untuk membuka/tutup sidebar.
   * Setiap pemanggilan akan membalikkan nilai dari isSidebarOpen (true ↔ false).
   */
  function toggleSidebar() {
    isSidebarOpen.value = !isSidebarOpen.value
  }

  // Mengembalikan semua state dan fungsi agar bisa digunakan di komponen-komponen lain
  return { isSidebarOpen, toggleSidebar, selected, page }
})
