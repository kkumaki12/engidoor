<template>
  <div class="chart-container">
    <line-chart
      :chartData="fillData()"
    />
  </div>
</template>
<script>
import LineChart from "./Chart.vue";
import axios from "axios";
  export default {
    data () {
      return {
        dataContents: null,
        weight1: ''
      }
    },
    created() {
      this.fillData()
    },
    methods: {
      fillData() {
        this.dataContents= {
          labels:['January', 'February', 'March'],
          datasets: [
            {
              label: 'Data reactive',
              backgroundColor: '#f8b979',
              data: [1,1,2]
            }
          ]
        }
      },
      setSample () {
        //var arry = [79.5, 80, 85];
        //return arry;
        axios.get('api/v1/users/17/comments_by_tag_count')
        .then((response) => {
          this.weight1 = response.data;

          console.log(this.weight1);
          console.log(response);
          return this.weight1
        })
      }
    },
    components: {
      LineChart,
    }
  }
</script>


