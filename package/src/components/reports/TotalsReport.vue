<script>
import AnalyticsReportMixin from "../mixins/AnalyticsReportMixin.js";

export default {
  mixins: [ AnalyticsReportMixin ],
  data() {
    return {
      reportId: 'totals-report',
      report: null
    }
  },
  computed: {
    query() {
      return {
        'ids': `ga:${this.gaViewId}`,
        'start-date': this.startDate.toISOString().split('T')[0],
        'end-date': this.endDate.toISOString().split('T')[0],
        'metrics': 'ga:users,ga:uniquePurchases,ga:itemRevenue'
      }
    },
    chart() {
      return {
        'container': this.reportId,
        'type': 'TABLE',
        'options': {
          'width': '100%'
        }
      }
    }
  }
}
</script>