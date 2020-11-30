import Spinner from "../utils/Spinner.vue";
import DateRangePicker from "../utils/DateRangePicker.vue";

export default {
  template: '<date-range-picker /><div :id="reportId"><spinner /></div>',
  components: { Spinner, DateRangePicker },
  props: {
    gapi: Object,
    authorized: Boolean,
    gaViewId: String
  },
  data() {
    return {
      reportId: 'base-container',
      report: null
    }
  },
  created() {
    this.gapi.analytics.ready(this.registerReport)
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
        query: this.query, chart: this.chart
      })

      if(this.authorized) this.refreshReport()
    }
  },
}
