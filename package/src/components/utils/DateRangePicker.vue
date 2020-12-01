<template>
  <div class="picker-row">
    <div>
      <label>From:</label>
      <datepicker @input="datesChanged" v-model="fromDate" :disabled-dates="fromDisabledDates" :language="this.currLang" :format="format"></datepicker>
    </div>
    <div>
      <label>To:</label>
      <datepicker @input="datesChanged" v-model="toDate" :disabled-dates="toDisabledDates" :language="this.currLang" :format="format"></datepicker>
    </div>
  </div>
</template>

<script>
import Datepicker from 'vuejs-datepicker'
import * as datepickerLocales from 'vuejs-datepicker/dist/locale'

export default {
  components: {
    Datepicker
  },
  props: {
    lang: {
      type: String,
      default: 'en'
    },
    format: {
      type: String,
      default: 'dd-MM-yyyy'
    },
    startDate: null,
    endDate: null,
  },
  data(){
    return {
      fromDate: this.startDate,
      toDate: this.endDate
    }
  },
  methods: {
    datesChanged(e){
      this.$emit('change', {startDate: this.fromDate, endDate: this.toDate});
    }
  },
  computed: {
    currLang(){
      return datepickerLocales[this.lang] || datepickerLocales.en
    },
    fromDisabledDates(){
      if (!this.endDate)
          return {}

      return {from: this.endDate}
    },
    toDisabledDates(){
      if (!this.startDate)
        return {}

      return {to: this.startDate}
    }
  }
}
</script>

<style scoped>
  .picker-row{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
  }
  .picker-button{
    background-color: #365a79;
    border-radius: 6px;
    color: white;
    border: none;
    height: 40px;
  }
</style>