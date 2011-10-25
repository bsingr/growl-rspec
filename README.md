# RSpec Integration with Growl

Provides a RSpec Formatter using the growl gem (and growlnotify)

## Install

    gem install growl-rspec

## Configuration

Put the following in your spec/spec_helper.rb

    RSpec.configure do |config|
      config.formatter = 'Growl::RSpec::Formatter'
    end

Further information have a look at lib/growl/rspec/formatter.rb

## License

see MIT-LICENSE
