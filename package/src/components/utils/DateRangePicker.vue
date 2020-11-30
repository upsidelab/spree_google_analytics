<template>
  <div class="picker-row">
    <div>
      <label>From:</label>
      <datepicker class="w-100" v-model="startDate" :disabled-dates="fromDisabledDates" :language="this.currLang" :format="format"></datepicker>
    </div>
    <div>
      <label>To:</label>
      <datepicker v-model="endDate" :disabled-dates="toDisabledDates" :language="this.currLang" :format="format"></datepicker>
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
  },
  data(){
    return {
      startDate: null,
      endDate: null
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
  }
</style>