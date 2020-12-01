# Spree Google Analytics
Add Google Analytics reports to your Spree app!

This gem allows for server-side sending and reviewing Google Analytics tracking data in Spree applications.
It supports Google Analytics Enhanced Ecommerce (UA) metrics.

One of the main benefits of this gem over other approaches is that it sends data directly from the server, ensuring that no purchase gets lost due to disabled frontend tracking.

## Installation

1. Add this extension to your Gemfile with this line:

    ```ruby
    gem 'spree_google_analytics', github: 'upsidelab/spree_google_analytics'
    ```

2. Install the gem using Bundler

    ```ruby
    bundle install
    ```

3. Run install task that will:
    - run migrations (can be skipped with `--skip-migrations`)
    - install webpacker with vue support (can be skipped with `--skip-webpacker-installer`)
    - install latest version of the spree_google_analytics npm package
    - copy to your project packs file [spree_google_analytics.js](https://github.com/upsidelab/spree-google-analytics/blob/master/lib/generators/spree_google_analytics/install/files/spree_google_analytics.js)
    - precompile assets
    
    ```ruby
    bundle exec rails g spree_google_analytics:install
    ```
   
4. Restart your server
    
   If your server was running, restart it so that it can find the assets properly.

## Usage

1. Setup Google Analytics

    follow the instructions [here](https://support.google.com/analytics/answer/1008015?hl=en)
    
2. Set required envs

    If you want to send tracking data with each purchase set:
    
    `ENV['GOOGLE_ANALYTICS_TRACKING_ID']` -  tracking id of your google analytics project
    
    If you want to see analytics reports in the admin panel set:
    
   `ENV['GOOGLE_ANALYTICS_VIEW_ID']` - view id that analytics reports will use 
   `ENV['GOOGLE_ANALYTICS_SERVICE_ACCOUNT_JSON_PATH']` -  a path to a json file containing your credentials
    
3. Enjoy!

## Extending



## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2020 Upsidelab, released under the BSD-3-Clause License
