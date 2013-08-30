# Less Rails Bootstrap 3.0.0 [![Build Status](https://travis-ci.org/metaskills/less-rails-bootstrap.png?branch=master)](https://travis-ci.org/metaskills/less-rails-bootstrap)

Bootstrap is Twitter's toolkit for kickstarting your site or app's CSS. It includes base styles for typography, forms, buttons, tables, grid layout, navigation, alerts, and more. To get started -- check out the [Bootstrap docs](http://getbootstrap.com/).

The less-rails-bootstrap project hooks into [less-rails](http://github.com/metaskills/less-rails) and [less.rb](http://github.com/cowboyd/less.rb), making Bootstrap's source LESS files, compiled CSS, and JavaScript files available in the Rails 3.1+ asset pipeline. 

The benefits:

* Assets are namespaced in twitter/bootstrap to avoid asset conflicts.
* Top level requires to get all stylesheets or javascripts.
* Ability to import or require individually namespaced stylesheets or javascripts.


## Installation

LESS requires a JavaScript runtime to work. Which one you use depends on your Ruby implementation. Two are shown for Ruby (MRI) and JRuby. Add only the relevant one to your Gemfile. If you want to use Bootstrap's JavaScript plugins, also add the `jquery-rails` gem. Finally, add `less-rails-bootstrap` and run `bundle install`.

```ruby
# Gemfile

gem 'therubyracer'  # If using Ruby
gem 'therubyrhino'  # If using JRuby
gem 'jquery-rails'  # If using Bootstrap's JS plugins.
gem 'less-rails-bootstrap'
```

## Basic CSS Use

### Simple way

Get the full Bootstrap stylesheet with a single line in your `application.css`.

```
/*
 *= require twitter/bootstrap
 */
```    

### Advanced way

In case when you just want to modify several LESS variables (i.e. change text color, etc.) and don't want to thinking about [Full Control & Customization](https://github.com/metaskills/less-rails-bootstrap-test#full-control--customization) you can run Rails generator:

```
rails generate less_rails_bootstrap:custom_bootstrap
```

It generates three files:

* `app/assets/stylesheets/custom_bootstrap/custom_bootstrap.less` - auto-generated file base on bootstrap.less file from original Twitter Bootstrap. Don't modify it!
* `app/assets/stylesheets/custom_bootstrap/variables.less` - in this file you can override Twitter Bootstrap variables or define own
* `app/assets/stylesheets/custom_bootstrap/mixins.less` - in this file you can override Twitter Bootstrap mixins or define own

Then just add single line to `application.css`.

```
/*
 *= require custom_bootstrap/custom_bootstrap
 */
```

> Please see the [less-rails-bootstrap-test](http://github.com/metaskills/less-rails-bootstrap-test) repo for examples that customize the CSS output by using LESS. The "CSS Tests Suites" section of the README and code is what you want to focus on. Also, check out the [LESS syntax](http://lesscss.org/). 

## Basic JavaScript Use

In `application.js`, require jQuery first. Now you can add all the Bootstrap plugins with a single line.

````
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
````

Or include plugins individually.

````
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap/modal
//= require twitter/bootstrap/alert
````


## Versioning

This gem will directly track the semantic versioning of the Twitter Bootstrap project. Our major and minor versions will always match to theirs, though we may have tiny patch level releases specific to this gem.


## Testing

Simple! Just clone the repo, then run `bundle install` and `bundle exec rake`. The tests will begin to run. We also use Travis CI to run our tests. The current build status is:

We also have a test rails project setup using all the examples documented above. If you make a github issue and complain about something, I will likely forward you to this project.

[https://github.com/metaskills/less-rails-bootstrap-test](https://github.com/metaskills/less-rails-bootstrap-test)


## [Contributing](https://github.com/metaskills/less-rails-bootstrap/blob/master/CONTRIBUTING.md)

## License

Twitter Bootstrap Project: http://twitter.github.com/bootstrap

Copyright 2011 Twitter, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Less::Rails is Copyright (c) 2011 Ken Collins, <ken@metaskills.net> and is distributed under the MIT license.



