<script setup lang="ts">
// const props = defineProps(['label', 'type', 'placeholder'])
const props = defineProps<{
  label: string
  type: string
  placeholder?: string // Optional placeholder
  modelValue: string // <-- PENTING: Untuk v-model
  error?: string // <-- Opsional: Untuk menampilkan pesan error individual
}>()

// Mendefinisikan event yang dapat dikeluarkan oleh komponen
const emit = defineEmits(['update:modelValue']) // <-- PENTING: Untuk v-model

// Fungsi yang dipanggil saat input berubah, mengeluarkan event update:modelValue
const handleInput = (event: Event) => {
  emit('update:modelValue', (event.target as HTMLInputElement).value)
}
</script>

<template>
  <div class="mb-4">
    <label class="mb-2.5 block font-medium text-black dark:text-white">{{ props.label }}</label>
    <div class="relative">
      <input
        :type="props.type"
        :placeholder="props.placeholder"
        :value="props.modelValue"
        @input="handleInput"
        class="w-full rounded-lg border border-stroke bg-transparent py-4 pl-6 pr-10 outline-none focus:border-primary focus-visible:shadow-none dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary text-black dark:text-white"
      />

      <span class="absolute right-4 top-4">
        <slot></slot>
      </span>
    </div>
    <!-- Menampilkan pesan error di bawah input jika ada -->
    <p v-if="props.error" class="text-red-500 text-sm mt-1">
      {{ props.error }}
    </p>
  </div>
</template>
