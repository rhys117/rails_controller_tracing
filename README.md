# RailsControllerTracing
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "rails_controller_tracing"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_controller_tracing
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Local testing - add to development.rb - NO LONGER WORKS `explicitly_unloadable_constants` was removed
```ruby
if Rails.env.development?
  reload_gems = %w(rails_controller_tracing) # names of gems which should autoreload
  config.autoload_paths += Gem.loaded_specs.values.inject([]){ |a,gem| a += gem.load_paths if reload_gems.include? gem.name; a }
  require 'active_support/dependencies'
  ActiveSupport::Dependencies.explicitly_unloadable_constants += reload_gems.map { |gem| gem.classify }
end
```
