<script setup>
// importing hyperscript from vue to create the HTML element
import { h, onMounted, ref } from 'vue'
// importing jsbarcode method from jsbarcode library
import JsBarcode from 'jsbarcode'

// defining props and props type to be used in Barcode component
const props = defineProps({
  value: [String, Number],
  format: [String],
  width: [String, Number],
  height: [String, Number],
  displayValue: {
    type: [String, Boolean],
    default: true,
  },
  text: [String, Number],
  fontOptions: [String],
  font: [String],
  textAlign: [String],
  textPosition: [String],
  textMargin: [String, Number],
  fontSize: [String, Number],
  background: [String],
  lineColor: [String],
  margin: [String, Number],
  marginTop: [String, Number],
  marginBottom: [String, Number],
  marginLeft: [String, Number],
  marginRight: [String, Number],
  flat: [Boolean],
  ean128: [String, Boolean],
  elementTag: {
    type: String,
    default: 'svg',
    validator: function (value) {
      return ['canvas', 'svg', 'img'].indexOf(value) !== -1
    },
  },
})

// ref for the barcode element
const barcodeRef = ref(null)

// custom function for taking props from the component and passing that to jsbarcode method and generating the barcode
function generateBarcode() {
  const settings = {
    format: props.format,
    width: props.width,
    height: props.height,
    displayValue: props.displayValue,
    text: props.text,
    fontOptions: props.fontOptions,
    font: props.font,
    textAlign: props.textAlign,
    textPosition: props.textPosition,
    textMargin: props.textMargin,
    fontSize: props.fontSize,
    background: props.background,
    lineColor: props.lineColor,
    margin: props.margin,
    marginTop: props.marginTop,
    marginBottom: props.marginBottom,
    marginLeft: props.marginLeft,
    marginRight: props.marginRight,
    flat: props.flat,
    ean128: props.ean128,
    valid: function (valid) {
      // You can emit this if needed
      // emit('valid', valid);
    },
    elementTag: props.elementTag,
  }

  // custom function calling to remove the undefined objects from the settings
  removeUndefinedProps(settings)

  // calling jsbarcode function and passing element, value and settings to generate the barcode
  JsBarcode(barcodeRef.value, props.value, settings)
}

// custom function to remove undefined objects from the settings
function removeUndefinedProps(obj) {
  Object.keys(obj).forEach((key) => (obj[key] === undefined ? delete obj[key] : {}))
}

// calling custom function (generateBarcode) inside onMounted lifecycle method
onMounted(() => {
  generateBarcode()
})
</script>

<template>
  <component :is="elementTag" ref="barcodeRef"></component>
</template>
