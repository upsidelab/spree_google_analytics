import * as components from './components'
import * as pages from './pages'
import Vue from 'vue'

document.addEventListener('DOMContentLoaded', () => {
  console.log(pages)
  console.log('LOADED')
  const app = new Vue({
    el: '#app',
    components: pages.MainPage
  })
})



// export function install(Vue) {
//     if (install.installed) return;
//     install.installed = true;
//
//     Object.keys(pages).forEach(name => {
//         const component = pages[name]
//         Vue.component(name, component);
//     })
// }
//
// // Create module definition for Vue.use()
// const plugin = {
//     install,
// };
//
// // Auto-install when vue is found (eg. in browser via <script> tag)
// let GlobalVue = null;
// if (typeof window !== 'undefined') {
//     GlobalVue = window.Vue;
// } else if (typeof global !== 'undefined') {
//     GlobalVue = global.Vue;
// }
// if (GlobalVue) {
//     GlobalVue.use(plugin);
// }

// To allow use as module (npm/webpack/etc.) export component
export default {
    components,
    pages
}