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
    // components used in few places
    'GapiAuth': components.GapiAuth,
    'ReportsWithDate': components.ReportsWithDate,
    // app/views/spree/admin/analytics/index.rb
    'TotalsReport': components.TotalsReport,
    // app/views/spree/admin/analytics/products.rb
    'ProductsReport': components.ProductsReport,
    // app/views/spree/admin/analytics/categories.rb
    'CategoriesReport': components.CategoriesReport,
    // app/views/spree/admin/analytics/users.rb
    'UsersReport': components.UsersReport,
    // app/views/spree/admin/analytics/sales.rb
    'SalesReport': components.SalesReport,
    // app/views/spree/admin/analytics/pages.rb
    'PagesReport': components.PagesReport
}

document.addEventListener(event, () => {
    new Vue({
        el: '#analytics_app',
        components: globalComponents
    })
})
