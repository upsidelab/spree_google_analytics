<template>
  <div>
    <div v-if="!canDisplayReport" class="alert alert-warning"> Could not display Google Analytics reports </div>
    <slot :gapi="gapi" :authorized="authorized" :ga-view-id="gaViewId" v-else/>
  </div>
</template>

<script>
import getGapi from '../../modules/gapi'

export default {
  props: {
    gaToken: String,
    gaViewId: String
  },
  data(){
    return {
      gapi: null,
      authorized: false
    }
  },
  computed: {
    canDisplayReport(){
      return !!this.gaToken && !!this.gaViewId
    }
  },
  created(){
    this.gapi = getGapi(window, document)

    if(!this.canDisplayReport){
      return
    }

    this.gapi.analytics.ready(() => {
      this.registerAuthHooks()
      this.authorizeAnalytics()
    })
  },
  methods: {
    registerAuthHooks(){
      this.gapi.analytics.auth.on('signIn', () => {
        this.authorized = true
      })

      this.gapi.analytics.auth.on('error', (r) => {
        this.authorized = false
        console.error(r.error.message)
      })
    },
    authorizeAnalytics(){
      this.gapi.analytics.auth.authorize({
        'serverAuth': {
          'access_token': this.gaToken
        }
      })
    }
  }
}
</script>
