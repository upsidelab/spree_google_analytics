# Spree Google Analytics
Add Google Analytics reports to your Spree app!

This gem allows for server-side sending and reviewing Google Analytics tracking data in Spree applications.
It supports Google Analytics Enhanced Ecommerce (UA) metrics.

Benefits of using this gem:
* Server side tracking
* Easy Customization
* Plug and play

One of the main advantages of using this gem is that it sends data directly from the server, ensuring that no purchase gets lost due to disabled frontend tracking. Giving more accurate insights into your buisness.

## Installation

1. Add this extension to your Gemfile with this line:

    ```ruby
    gem 'spree_google_analytics', github: 'upsidelab/spree_google_analytics'
    ```

2. Install the gem using Bundler

    ```sh
    bundle install
    ```

3. Run install task that will:
    - install webpacker with vue support
    - install latest version of the spree_google_analytics npm package
    - copy to your project packs file [spree_google_analytics.js](https://github.com/upsidelab/spree-google-analytics/blob/master/lib/generators/spree_google_analytics/install/files/spree_google_analytics.js)
    - precompile assets
    
    ```sh
    bundle exec rails spree_google_analytics:install
    ```

    If you already have webpacker with Vue installed then run 

    ```sh
    bundle exec rails spree_google_analytics:install -- --skip-webpacker-installer
    ```

   
4. Restart your server
    
   If your server was running, restart it so that it can find the assets properly.

## Usage

1. Setup Google Analytics

    follow the instructions [here](https://support.google.com/analytics/answer/1008015?hl=en)
    
2. Set required envs

    If you want to send tracking data with each purchase, set:
    
        `ENV['GOOGLE_ANALYTICS_TRACKING_ID']` -  tracking id of your Google Analytics project
    
    If you want to see analytics reports in the admin panel, set:
    
        `ENV['GOOGLE_ANALYTICS_VIEW_ID']` - view id that analytics reports will use 
        `ENV['GOOGLE_ANALYTICS_SERVICE_ACCOUNT_JSON_PATH']` -  a path to a json file containing your credentials
    
3. Enjoy!

## Customizing


### Overriding views

If you wish to extend or alter our analytics reports you can easily override views of our gem.

To copy gem views into host app run:

```sh
bundle exec rails spree_google_analytics:copy_views
```

----

### Creating your own Vue components

If you want to create your own Vue component you can simply create new `.vue` file in `app/javascripts/packs` directory.
Using it your other `.vue` files requires no further setup

----

### Using new components in html.erb / html.haml files

If you wish to use component tag directly in view file, you will have to first register the component in [spree_google_analytics.js](https://github.com/upsidelab/spree-google-analytics/blob/master/lib/generators/spree_google_analytics/install/files/spree_google_analytics.js) like so:

```js
// app/packsjavascripts/packs/spree_google_analytics.js

import MyNewComponent from '../MyNewComponent.vue'

const globalComponents = {
    ...
    MyNewComponent,
    ...
}
```
And then simply use it in html.erb:

```html
<!-- app/views/spree/admin/analytics/some_view.html.erb -->

<%= render 'spree/admin/shared/analytics_vue_mount' do %>
    <my-new-component></my-new-component>
<% end %>
```

----

### Adding new report page

If you want to create completely new report along with new view file and new route you can decorate `Spree::Admin::AnalyticsController`

```ruby
# app/controllers/spree/admin/analytics_controller_decorator.rb

module Spree
    module Admin
        AnalyticsController.class_eval do
            add_report :new_report
        end
    end
end
```

the above will automatically create controller action `new_report#analytics` as well as **GET** route `admin/analytics/new_report`. The only thing left for you to add is corresponding view file like:

```html
<!-- app/views/spree/admin/analytics/new_report.html.erb -->

<!-- no vue here -->
<%= render 'spree/admin/shared/analytics_vue_mount' do %> 
    <!-- Everything in here will be inside Vue app instance -->
<% end %>
<!-- no vue here -->
```

____

### Adding Vue plugins and altering Vue app instance

partial `app/views/spree/admin/shared/_analytics_vue_mount` includes this gem javascripts and provides a mounting point for Vue instance defined in [spree_google_analytics.js](https://github.com/upsidelab/spree-google-analytics/blob/master/lib/generators/spree_google_analytics/install/files/spree_google_analytics.js)

The above means that Vue by default will try to mount only on the pages using  `<%= render 'spree/admin/shared/analytics_vue_mount' %>`

If you want to add plugin or change Vue instance definition you can simply alter [spree_google_analytics.js](https://github.com/upsidelab/spree-google-analytics/blob/master/lib/generators/spree_google_analytics/install/files/spree_google_analytics.js) file

```js
// app/packsjavascripts/packs/spree_google_analytics.js

import MyPlugin from 'my_plugin'

...

Vue.use(MyPlugin)

document.addEventListener(event, () => {
    new Vue({
        el: '#analytics_app',
        components: globalComponents,
        // any changes you want here
    })
})
```
____
### Using turbolinks

This gem support turbolinks usage by utilizing `vue-turbolinks`. By default they're turned off. If you want to turn them on you will need to add `vue-turbolinks` package to your `/node_modules` by calling `yarn add vue-turbolinks` and then changing mount event in [spree_google_analytics.js](https://github.com/upsidelab/spree-google-analytics/blob/master/lib/generators/spree_google_analytics/install/files/spree_google_analytics.js)

```js
// app/packsjavascripts/packs/spree_google_analytics.js

...

Vue.use(TurbolinksAdapter)
const event = 'turbolinks:load'

...
```


Copyright (c) 2020 Upsidelab, released under the BSD-3-Clause License
