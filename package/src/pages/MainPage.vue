<template>
  <div class="example">{{ msg }}</div>
  <test-a />
  <test-b />
</template>


<script>
import TestA from '../components/TestA'
import TestB from '../components/TestB'

export default {
  data () {
    return {
      msg: 'Hello from MainPage'
    }
  },
  components: {
    TestA,
    TestB,
  },
}
</script>

<style>
.example {
  color: red;
}
</style>
