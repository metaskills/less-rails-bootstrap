# less-rails-bootstrap Issues

## Troubleshooting

Please try to update to latest version with `bundle update less-rails-bootstrap` before creating an issue.

Do not forget to lock major version in `Gemfile`. 

**For Twitter Bootstrap 2.3 use:**

```ruby
gem 'less-rails-bootstrap', '~> 2.3.3'
```

**For Twitter Bootstrap 3 use:**

```ruby
gem 'less-rails-bootstrap', '~> 3.0.0'
```

If you are looking for older versions of Twitter Bootstrap or you're facing the wrong path to Twitter Bootstrap resources problem, then try the following steps:

* reset Asset Pipeline cache with `rake tmp:clear`
* check settings related to caching inside 'environments/*.rb' files
* remove `assets` directory from `public` directory if it exists in your development environment

## Reporting problems

Please include:

 - Your rails version (you can find in `Gemfile.lock`)
 - Your less-rails-bootstrap version (you can find in `Gemfile.lock`)
 - What version of Ruby you are using (run `ruby -v`)

Thanks for reporting an issue and helping make less-rails-bootstrap better!
