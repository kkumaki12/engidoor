<template>
  <div class="container">
    <line-chart
      v-if="loaded"
      :chartdata="chartdata"
      :options="options"/>
  </div>
</template>

<script>
import LineChart from './Chart.vue'
import axios from 'axios'

export default {
  name: 'LineChartContainer',
  components: { LineChart },
  data: () => ({
    loaded: false,
    chartdata: null
  }),
  async mounted () {
    this.loaded = false
      try {
        await axios.get('/api/v1/users/17/comments_by_tag_count_values').then((response) => {
        this.chartData = response.data
        this.loaded = true
    })
  }
  }
}
</script>
