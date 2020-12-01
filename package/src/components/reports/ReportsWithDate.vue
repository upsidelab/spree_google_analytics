<template>
  <div>
    <date-range-picker class="separator" @change="newChosenDates" :start-date="startDate" :end-date="endDate"></date-range-picker>
    <slot :start-date="startDate" :end-date="endDate"/>
  </div>
</template>

<script>

import DateRangePicker from "../utils/DateRangePicker.vue"

function dateInPast(number){
  const date = new Date();
  date.setDate(date.getDate() - number);
  return date;
}

export default {
  components: {
    DateRangePicker
  },
  data(){
    return {
      startDate: dateInPast(30),
      endDate:  dateInPast(1)
    }
  },
  methods: {
    newChosenDates({startDate, endDate}){
      this.startDate = startDate
      this.endDate = endDate
    }
  }
}
</script>

<style scoped>
  .separator{
    margin-bottom: 40px;
  }
</style>