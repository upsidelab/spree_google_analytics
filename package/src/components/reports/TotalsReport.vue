<template>
  <div>
    <date-range-picker></date-range-picker>
    <div :id="reportId">
      <spinner></spinner>
    </div>
  </div>
</template>

<script>
import Spinner from "../utils/Spinner.vue";
import DateRangePicker from "../utils/DateRangePicker.vue";

export default {
  components: {
    Spinner,
    DateRangePicker
  },
  props: {
    gapi: Object,
    authorized: Boolean,
    gaViewId: String
  },
  data() {
    return {
      reportId: 'summary-container',
      report: null
    }
  },
  watch: {
    authorized(newVal, oldVal){
      if(oldVal === false && newVal === true){
        this.refreshReport()
      }
    }
  },
  methods: {
    refreshReport() {
      this.report.execute()
    },
    registerReport(){
      this.report = new this.gapi.analytics.googleCharts.DataChart({
        query: {
          'ids': `ga:${this.gaViewId}`,
          'start-date': '30daysAgo',
          'end-date': 'yesterday',
          'metrics': 'ga:users,ga:uniquePurchases,ga:itemRevenue'
        },
        chart: {
          'container': this.reportId,
          'type': 'TABLE',
          'options': {
            'width': '100%'
          }
        }
      });

      if(this.authorized){
        this.refreshReport()
      }
    }
  },
  created() {
    this.gapi.analytics.ready(this.registerReport)
  }
}
</script>