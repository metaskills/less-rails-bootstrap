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
