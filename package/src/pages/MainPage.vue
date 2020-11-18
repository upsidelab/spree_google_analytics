<template>
  <div>
    <p class="example">{{ msg }}</p>
    <test-a />
    <test-b />
  </div>
</template>


<script>
 import {
   TestA,
   TestB
 } from '../components'

export default {
  data () {
    return {
      msg: 'Hello from MainPage'
    }
  },
  components: {
    TestA,
    TestB
  },
}
</script>

<style>
.example {
  color: red;
}
</style>
