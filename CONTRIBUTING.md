## Contributing

Here are the steps to update the version of twitter bootstrap used.

* Clone this repository.
* Clone the [bootstrap repo](https://github.com/twitter/bootstrap) in a twitter/bootstrap directory next to the clone of less-rails-bootstrap done above.
* Change directories into the twitter/bootstrap clone and do a git checkout on the version you are targeting. For example `git checkout v2.3.0`. This will setup the proper version to copy over.
* Back in the less-rails-bootstrap project. Run the `./scripts/update_bootstrap.sh` script.
* RUN THE TESTS!
