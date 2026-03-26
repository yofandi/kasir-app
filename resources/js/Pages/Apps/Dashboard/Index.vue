<script setup lang="ts">
import { ref } from 'vue'
import { Head } from '@inertiajs/inertia-vue3'
import BreadcrumbDefault from '../../../Components/Breadcrumbs/BreadcrumbDefault.vue'
import DataStatsOne from '../../../Components/DataStats/DataStatsOne.vue'
import ChartOne from '../../../Components/Charts/ChartOne.vue'
import ChartSevenDay from '../../../Components/Charts/ChartSevenDay.vue'
import ChartBestSelling from '../../../Components/Charts/ChartBestSelling.vue'
import DataProductStock from '../../../Components/DataStats/DataProductStock.vue'
import ChartThree from '../../../Components/Charts/ChartThree.vue'
import ChartTwo from '../../../Components/Charts/ChartTwo.vue'
import ChatCard from '../../../Components/ChatCard.vue'
import MapOne from '../../../Components/Maps/MapOne.vue'
import TableOne from '../../../Components/Tables/TableOne.vue'

const pageTitle = ref('Dasboard')

const props = defineProps({
  //total penjualan hari ini
  count_sales_today: Number,

  //jumlah (Rp.) penjualan hari ini
  sum_sales_today: Number,

  //jumlah profit/laba hari ini
  sum_profits_today: Number,

  product: Array,
  sales_date: Array,
  grand_total: Array,
  products_limit_stock: Number,
  total: Array,
})
</script>

<template>
  <Head>
    <title>Dashboard</title>
  </Head>
  <BreadcrumbDefault :pageTitle="pageTitle" />
  <div class="grid grid-cols-1 gap-4 md:grid-cols-2 md:gap-6 xl:grid-cols-4 2xl:gap-7.5">
    <DataStatsOne
      :countSalesToday="props.count_sales_today"
      :sumSalesToday="props.sum_sales_today"
      :sumProfitsToday="props.sum_profits_today"
      :product="props.product"
    />
  </div>

  <div class="mt-4 grid grid-cols-12 gap-4 md:mt-6 md:gap-6 2xl:mt-7.5 2xl:gap-7.5">
    <!-- ==== chart seven day  -->
    <ChartSevenDay :data="props" />

    <!-- === chart best selling product -->
    <ChartBestSelling :data="props" />

    <DataProductStock :data="products_limit_stock" />

    <!-- ====== Chart One Start -->
    <ChartOne />
    <!-- ====== Chart One End -->

    <!-- ====== Chart Two Start -->
    <ChartTwo />
    <!-- ====== Chart Two End -->

    <!-- ====== Chart Three Start -->
    <ChartThree />
    <!-- ====== Chart Three End -->

    <!-- ====== Map One Start -->
    <MapOne />
    <!-- ====== Map One End -->

    <!-- ====== Table One Start -->
    <div class="col-span-12 xl:col-span-8">
      <TableOne />
    </div>
    <!-- ====== Table One End -->

    <!-- ====== Chat Card Start -->
    <ChatCard />
    <!-- ====== Chat Card End -->
  </div>
</template>
