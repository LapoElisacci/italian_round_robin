# ItalianRoundRobin

![](https://github.com/LapoElisacci/italian_round_robin/actions/workflows/main.yml/badge.svg)
![](https://img.shields.io/static/v1?label=Coverage&message=100%&color=brightgreen)
![](https://img.shields.io/static/v1?label=Latest&message=0.1.0&color=blue)
![](https://img.shields.io/static/v1?label=Licence&message=MIT&color=green)

The Gem allows you to generate Round Robin tournament pairings based on Berger tables.

[Wikipedia](https://en.wikipedia.org/wiki/Round-robin_tournament#Berger_tables)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add italian_round_robin

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install italian_round_robin

## Usage

Passing a list of any item to the `generate` method will return all rounds based on Berger tables:

```ruby
members = [1, 2, 3, 4] # This can be a list of anything (Integer, String, Object, ...)
rounds = ItalianRoundRobin.generate(members)

# [
#     [[1, 4], [2, 3]],
#     [[4, 3], [1, 2]],
#     [[2, 4], [3, 1]]
# ]
```

The gem supports odd numbers of players as well, a `nil` value will stand for BYE

```ruby
members = [1, 2, 3, 4, 5] # This can be a list of anything (Integer, String, Object, ...)
rounds = ItalianRoundRobin.generate(members)

# [
#     [[1, nil], [2, 5], [3, 4]],
#     [[nil, 4], [5, 3], [1, 2]],
#     [[2, nil], [3, 1], [4, 5]],
#     [[nil, 5], [1, 4], [2, 3]],
#     [[3, nil], [4, 2], [5, 1]]
# ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/LapoElisacci/italian_round_robin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/LapoElisacci/italian_round_robin/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ItalianRoundRobin project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/LapoElisacci/italian_round_robin/blob/main/CODE_OF_CONDUCT.md).
