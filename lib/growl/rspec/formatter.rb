require 'rspec/core/formatters'

module Growl
  module RSpec
    # The Growl::RSpec::Formatter depens on the growl gem
    # (and therefore, growlnotify bin must be installed) 
    #
    # Use it by putting this in your spec_helper.rb
    #    RSpec.configure do |config|
    #       config.formatter = 'Growl::RSpec::Formatter'
    #    end
    #
    # You can switch off granular growls about each spec failure via:
    #    Growl::RSpec::Formatter.config = {
    #      :growl_failures => false
    #    }
    #
    # You can configure additional growlnotify options like:
    #    Growl::RSpec::Formatter.growlnotify_config = {
    #      :host => 'your.growl.host'
    #    }
    #
    class Formatter
      ::RSpec::Core::Formatters.register self, :dump_failures, :dump_summary

      # the formatters default config hash
      DEFAULT_CONFIG = {
        :growl_failures => true
      }.freeze

      # read the formatters config hash
      def self.config
        @@config ||= DEFAULT_CONFIG
      end

      # set the formatters config hash
      def self.config=(c)
        @@config = DEFAULT_CONFIG.dup.merge(c)
      end

      # set the config hash that is passed to growlnotify gem
      def self.growlnotify_config=(o)
        @@_growlnotify_config = o
      end

      # get the config hash that is passed to growlnotify gem
      def self.growlnotify_config
        @@_growlnotify_config ||= {}
      end

      def initialize output
        @output = output
      end

      # hook when spec failed
      def dump_failures(examples_notification)
        return if examples_notification.failed_examples.empty?
        if self.class.config[:growl_failures]

          msg = examples_notification.failed_examples.each_with_index.map do |example, idx|
            ["#{idx+1}. it #{example.description}",
             example.metadata[:execution_result][:exception]]
          end.flatten.join("\n\n")

          ::Growl.notify_warning msg, {
            :title => "#{examples_notification.failed_examples.size} specs failed"
          }.merge(self.class.growlnotify_config)
        end
      end

      # hook when all specs ran
      def dump_summary(summary)
        msg = "#{summary.example_count} specs in total (#{summary.pending_count} pending). "\
              "Consumed #{summary.duration.round(1)}s"

        title = if summary.failure_count == 0
          "All specs passed."
        else
          "#{summary.failure_count} specs failed!"
        end

        ::Growl.notify_info msg, { :title => title }.merge(self.class.growlnotify_config)
      end
    end
  end
end
