# RSpec Integration with Growl

Provides a RSpec Formatter using the growl gem (and growlnotify)

## Install

**RSpec 3**

    gem install growl-rspec

**RSpec 2**

    gem install growl-rspec -v 0.0.2

## Configuration

Put the following in your spec/spec_helper.rb

    RSpec.configure do |config|
      config.formatter = 'Growl::RSpec::Formatter'
    end

Further information have a look at lib/growl/rspec/formatter.rb

## License

see MIT-LICENSE


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/dpree/growl-rspec/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

