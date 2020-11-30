<script>
import AnalyticsReportMixin from "../mixins/AnalyticsReportMixin";

export default {
  mixins: [ AnalyticsReportMixin ],
  computed: {
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
  }
}
</script>