import Spinner from "../utils/Spinner.vue";

export default {
  template: `
    <div :id="reportId">
      <spinner />
    </div>
  `,
  components: { Spinner },
  props: {
    gapi: Object,
    authorized: Boolean,
    gaViewId: String,
    startDate: Date,
    endDate: Date,
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
    },
    startDate(){
      if(this.authorized) this.refreshReport()
    },
    endDate(){
      if(this.authorized) this.refreshReport()
    }
  },
  methods: {
    refreshReport() {
      if(!!this.report) this.report.set({query: this.query}).execute()
    },
    registerReport(){
      this.report = new this.gapi.analytics.googleCharts.DataChart({
        query: this.query, chart: this.chart
      })

      if(this.authorized) this.refreshReport()
    }
  },
}
