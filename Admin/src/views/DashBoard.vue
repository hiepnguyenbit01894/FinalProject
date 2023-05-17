<template>
  <home></home>
  <div class="py-4 container-fluid">
    <div class="row">
      <div class="col-lg-12">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12">
            <card
              :title="stats.products.title"
              :value="stats.products.value"
              :iconClass="stats.products.iconClass"
              :iconBackground="stats.products.iconBackground"
              directionReverse
            ></card>
          </div>
          <div class="col-lg-4 col-md-8 col-12">
            <card
              :title="stats.users.title"
              :value="stats.users.value"
              :percentage="stats.users.percentage"
              :iconClass="stats.users.iconClass"
              :iconBackground="stats.users.iconBackground"
              directionReverse
            ></card>
          </div>
          <div class="col-lg-4 col-md-8 col-12">
            <card
              :title="stats.clients.title"
              :value="stats.clients.value"
              :percentage="stats.clients.percentage"
              :iconClass="stats.clients.iconClass"
              :iconBackground="stats.clients.iconBackground"
              :percentageColor="stats.clients.percentageColor"
              directionReverse
            ></card>
          </div>
        </div>
      </div>
      <apexchart
        width="1000"
        type="line"
        :options="options"
        :series="series"
      ></apexchart>
    </div>
  </div>
</template>
<script>
import Card from "@/examples/Cards/Card.vue";
import US from "@/assets/img/icons/flags/US.png";
import DE from "@/assets/img/icons/flags/DE.png";
import GB from "@/assets/img/icons/flags/GB.png";
import BR from "@/assets/img/icons/flags/BR.png";
import Home from "./Home.vue";
import axios from "axios";
export default {
  name: "dashboard-default",
  data() {
    return {
      stats: {
        products: {
          title: "Products",
          value: 0,
          iconClass: "mdi-achive",
          iconBackground: "bg-gradient-primary",
        },
        users: {
          title: "Users",
          value: "2,300",
          iconClass: "ni ni-world",
          iconBackground: "bg-gradient-danger",
        },
        clients: {
          title: "Orders",
          value: "+3,462",
          iconClass: "ni ni-paper-diploma",
          percentageColor: "text-danger",
          iconBackground: "bg-gradient-success",
        },
        sales: {
          title: "Sales",
          value: "$103,430",
          iconClass: "ni ni-cart",
          iconBackground: "bg-gradient-warning",
        },
      },
      sales: {
        us: {
          country: "United States",
          sales: 2500,
          value: "$230,900",
          bounce: "29.9%",
          flag: US,
        },
        germany: {
          country: "Germany",
          sales: "3.900",
          value: "$440,000",
          bounce: "40.22%",
          flag: DE,
        },
        britain: {
          country: "Great Britain",
          sales: "1.400",
          value: "$190,700",
          bounce: "23.44%",
          flag: GB,
        },
        brasil: {
          country: "Brasil",
          sales: "562",
          value: "$143,960",
          bounce: "32.14%",
          flag: BR,
        },
      },
      options: {
        chart: {
          id: "vuechart-example",
        },
        xaxis: {
          categories: [""],
        },
      },
      series: [
        {
          name: "series-1",
          data: [0],
        },
      ],
    };
  },
  created() {
    this.statistic();
    this.inforStatic();
  },
  methods: {
    converTime(param) {
      let date = new Date(param.replace(/T/, "/"));
      let month = date.getMonth() + 1;
      param = date.getDate()  + "/" + month + "/" + date.getFullYear();
      return param;
    },
    statistic() {
      axios.get(`http://localhost:2828/home/order/statistic`).then((res) => {
        let data = res.data.result;
        data.map((value) => {
          this.options.xaxis.categories.push(this.converTime(value.created_at));
          this.series[0].data.push(value.total);
        });
      });
    },
    inforStatic() {
      axios.get(`http://localhost:2828/home/statistic`).then((res) => {
        let val = res.data.result[0];
        console.log(val);
        this.stats.products.value = val.totalProduct;
        this.stats.users.value = val.totalUsers;
        this.stats.clients.value = val.totalOrder;
      });
    },
  },
  components: {
    Home,
    Card,
  },
};
</script>
