# Steam

[![Rubocop Status](https://github.com/jubishop/steam/workflows/Rubocop/badge.svg)](https://github.com/jubishop/steam/actions)

A Ruby library for Steam's API.

## Installation

### Global installation

```zsh
gem install steam --source https://www.jubigems.org/
```

### In a Gemfile

```ruby
gem 'steam', source: 'https://www.jubigems.org/'
```

## Usage

```ruby
api = Steam::API.new
api.player_summary(76561198257073170)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
