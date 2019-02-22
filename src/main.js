import Vue from 'vue'
import App from './App'
import interfaces from './utils/interfaces'
import store from './store/index'

import https from './utils/https'

Vue.config.productionTip = false
Vue.prototype.$store = store
Vue.prototype.$interfaces=interfaces
Vue.prototype.$https=https
App.mpType = 'app'

const app = new Vue(App)
app.$mount()
