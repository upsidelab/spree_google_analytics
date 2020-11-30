<template>
  <div>
    TotalsReport
    <br/>
    {{authorized}}
  </div>
</template>

<script>
export default {
  props: {
    gapi: Object,
    authorized: Boolean
  },
}
</script>