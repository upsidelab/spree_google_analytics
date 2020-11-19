import { components, pages } from "spree_google_analytics"
import Vue from 'vue/dist/vue.esm.js'

// If the project is using turbolinks, install 'vue-turbolinks':
// yarn add vue-turbolinks
//
// Comment out this line
const event = 'DOMContentLoaded'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// Vue.use(TurbolinksAdapter)
// const event = 'turbolinks:load'

const globalComponents = {
    // views/spree/admin/analytics/index.html.erb
    'TestA': components.TestA,
    'TestB': components.TestB
}

document.addEventListener(event, () => {
    new Vue({
        el: '#app',
        components: globalComponents
    })
})