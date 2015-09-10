# Tvinfo

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tvinfo`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tvinfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tvinfo

## Configuration

The location of the config file is `~/.config/tvinfo/config.yml`.

An example configuration might look like this:

```yaml
api_key: <thetvdb.com api key>
skip_past_episodes: yes
skip_tba_episodes: yes
caldav:
  url: <caldav url>
  username: <caldav username>
  password: <caldav password>
shows:
  - Doctor Who (2005)
  - Castle (2009)
  - Vikings
  - "CSI: Crime Scene Investigation"
  - Game of Thrones
  - Elementary
  - Person of Interest
  - Sherlock
  - Criminal Minds
  - Sons of Anarchy
```

## Usage

    $ tvinfo

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tvinfo.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

