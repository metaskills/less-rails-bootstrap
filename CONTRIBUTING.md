# Creating Issues

If you're having a problem, please see [ISSUES](https://github.com/metaskills/less-rails-bootstrap/blob/master/ISSUES.md) for troubleshooting steps and a guide for how to submit a ticket that will help us solve the problem you are having as quickly as possible.

## Contributing

Here are the steps to update the version of twitter bootstrap used.

* Clone this repository.
* Run the `./scripts/update_bootstrap.sh` script with bootstrap repo version tag argument. For example `./scripts/update_bootstrap.sh v3.0.0`.
* Make your changes
* Run the tests by doing:

```
$ bundle install
$ bundle exec rake appraisal:setup
$ bundle exec rake appraisal test
```
