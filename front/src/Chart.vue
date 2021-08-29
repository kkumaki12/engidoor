<script>
import { Pie } from 'vue-chartjs'
import axios from 'axios'

export default {
  props: ["records" ,"user_id"],
  extends: Pie,
  name: "chart",
    data () {
    return {
      value:[],
      data: {
        labels: [],
        datasets: [
          {
            label: 'Pie Dataset',
            data: [],
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
          },
        ]
      },
      options: {
        scales: {
          xAxes: [{
            scaleLabel: {
              display: true,
              labelString: 'ジャンル'
            }
          }],
          yAxes: [{
            ticks: {
              beginAtZero: true,
              stepSize: 10,
            }
          }]
        }
      }
    }
  },
 
  async mounted() {
    await axios.get(`api/v1/users/${this.$route.params.id}/comments_by_tag_count`)
        .then((response) => {
          this.data.labels = response.data;

          console.log(this.data.labels);
          console.log(response);

        });
    await axios.get(`api/v1/users/${this.$route.params.id}/comments_by_tag_count_values`)
        .then((response) => {
          this.data.datasets[0].data = response.data
          console.log(this.data.datasets[0].data);
          console.log(response);
          
        });
     this.renderChart(this.data, this.options);
               console.log(this.user_id);
  }

};
</script>
