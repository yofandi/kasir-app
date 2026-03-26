<template>
  <div class="flex items-center justify-between px-4 py-3 sm:px-6 rounded-md shadow">
    <!-- Mobile pagination -->
    <div class="flex flex-1 justify-between sm:hidden">
      <Link
        :href="links.prev_page_url || '#'"
        class="relative inline-flex items-center rounded-md border border-gray-700 bg-gray-800 px-4 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700"
        :class="{ 'pointer-events-none opacity-50': !links.prev_page_url }"
      >
        Previous
      </Link>
      <Link
        :href="links.next_page_url || '#'"
        class="relative ml-3 inline-flex items-center rounded-md border border-gray-700 bg-gray-800 px-4 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700"
        :class="{ 'pointer-events-none opacity-50': !links.next_page_url }"
      >
        Next
      </Link>
    </div>

    <!-- Desktop pagination -->
    <div class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between">
      <!-- Info -->
      <div>
        <p class="text-sm text-gray-400">
          Showing
          <span class="font-medium text-gray-200">{{ links.from }}</span>
          to
          <span class="font-medium text-gray-200">{{ links.to }}</span>
          of
          <span class="font-medium text-gray-200">{{ links.total }}</span>
          results
        </p>
      </div>

      <!-- Links -->
      <div>
        <nav
          class="isolate inline-flex -space-x-px rounded-md border border-gray-700 bg-gray-800 shadow-sm"
          aria-label="Pagination"
        >
          <li v-for="(link, index) in links.links" :key="index" class="list-none">
            <Link
              :href="link.url || '#'"
              v-html="link.label"
              class="relative inline-flex items-center px-4 py-2 border text-sm font-medium"
              :class="[
                link.url === null
                  ? 'text-gray-500 bg-gray-700 border-gray-600 cursor-not-allowed'
                  : link.active
                    ? 'z-10 bg-indigo-600 border-indigo-600 text-white'
                    : 'bg-gray-800 border-gray-600 text-gray-300 hover:bg-gray-700',
              ]"
            />
          </li>
        </nav>
      </div>
    </div>
  </div>
</template>

<script setup>
// import inertia link
import { Link } from '@inertiajs/inertia-vue3'

// props dari Inertia
const props = defineProps({
  links: Object,
})
</script>
