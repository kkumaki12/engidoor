<script>
import { Bar } from 'vue-chartjs'

export default {
  props: ["records"],
  extends: Bar,
  name: "chart",
  data() {
    return {
      data: {
        labels: [
          "キッチン",
          "風呂",
          "トイレ"
        ],
        datasets: [
          {
            label: "鈴木",
            data: [
              1,
              2,
              3
            ],
            backgroundColor: [
              "rgba(255, 99, 132, 0.2)",
              "rgba(255, 99, 132, 0.2)",
              "rgba(255, 99, 132, 0.2)",
            ],
            borderColor: [
              "rgba(255, 99, 132, 1)",
              "rgba(255, 99, 132, 1)",
              "rgba(255, 99, 132, 1)",
            ],
            borderWidth: 1
          },
          {
            label: "佐藤",
            data: [
              1,
              2,
              3
            ],
            backgroundColor: [
              "rgba(54, 162, 235, 0.2)",
              "rgba(54, 162, 235, 0.2)",
              "rgba(54, 162, 235, 0.2)"
            ],
            borderColor: [
              "rgba(54, 162, 235, 1)",
              "rgba(54, 162, 235, 1)",
              "rgba(54, 162, 235, 1)"
            ],
            borderWidth: 1
          }
        ]
      },
      options: {
        scales: {
          xAxes: [
            {
              scaleLabel: {
                display: false,
                labelString: ""
              }
            }
          ],
          yAxes: [
            {
              ticks: {
                beginAtZero: true,
                stepSize: 5
              }
            }
          ]
        }
      }
    };
  },
  mounted() {
    this.renderChart(this.data, this.options);
  }
};
</script>
