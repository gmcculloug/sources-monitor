# Sources::Monitor

This Project houses the monitoring tools for Sources, including:
- Availability Check

The Availability Checker is responsible for scheduling checks on both available and unavailable sources and
requesting the checks to the appropriate operation workers via messaging.

## Running

First clone the project and run bundle,

    $ git clone git@github.com:abellotti/sources-monitor.git

    $ bundle

Run availability checker:

    $ bin/availability_checker [available | unavailable]


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abellotti/sources-monitor.

## License

This project is available as open source under the terms of the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
