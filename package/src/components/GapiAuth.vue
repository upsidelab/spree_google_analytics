<template>
  <div>
    <div v-if="!canDisplayReport" class="alert alert-warning"> Could not display Google Analytics reports </div>
    <slot v-else/>
  </div>
</template>

<script>
import getGapi from '../modules/gapi'

export default {
  props: {
    gaToken: String,
    gaViewId: String
  },
  data(){
    return {
      gapi: null
    }
  },
  computed: {
    canDisplayReport(){
      return !!this.gaToken && !!this.gaViewId
    }
  },
  created(){
    this.gapi = getGapi(window, document)
  },
  mounted(){
    if(!this.canDisplayReport){
      return
    }

    this.gapi.analytics.ready(function() {
      this.gapi.analytics.auth.authorize({
        'serverAuth': {
          'access_token': this.gaToken
        }
      })
    })
  }
}
</script>
