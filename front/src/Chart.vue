<template>
  <div id="app" style="width:600px">
    <canvas id="myChart"></canvas>
  </div>
</template>

<script>
import { Line, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins 

export default {
  extends: Line,
  mixins: [reactiveProp], 
  props: { 
    chartData: Object,
    options: Object
  },
  mounted () {
    this.renderChart(this.chartData, this.options)
  }

}
</script>
