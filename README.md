# Sources::Monitor

[![Build Status](https://api.travis-ci.org/gmcculloug/sources-monitor.svg)](https://travis-ci.org/gmcculloug/sources-monitor)
[![Maintainability](https://api.codeclimate.com/v1/badges/5e8f606e9cb7a47234df/maintainability)](https://codeclimate.com/github/gmcculloug/sources-monitor/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5e8f606e9cb7a47234df/test_coverage)](https://codeclimate.com/github/gmcculloug/sources-monitor/test_coverage)
[![security](https://hakiri.io/github/RedHatInsights/sources-monitor/master.svg)](https://hakiri.io/github/RedHatInsights/sources-monitor/master)

This Project houses the monitoring tools for Sources, including:
- Availability Checker

The Availability Checker is responsible for scheduling checks on both available and unavailable sources and
requesting the checks to the appropriate operation workers via messaging.

## Running

First clone the project and run bundle,

    $ git clone git@github.com:RedHatInsights/sources-monitor.git

    $ bundle

Run availability checker:

    $ bin/availability_checker [available | unavailable]


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RedHatInsights/sources-monitor.

## License

This project is available as open source under the terms of the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
