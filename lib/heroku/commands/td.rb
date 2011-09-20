require 'td'
require 'td/command/list'
require 'td/config'

module Heroku::Command

  class Td < BaseWithApp
    def index
      cmd = args.shift
      unless cmd
        puts "TODO: show usage"
        return -1
      end

      # set apikey
      apikey =  heroku.config_vars(app)['TREASURE_DATA_API_KEY']
      TreasureData::Config.apikey = apikey

      method = TreasureData::Command::List.get_method(cmd)
      unless method
        $stderr.puts "'#{cmd}' is not a td command. Run '#{$prog}' to show the list."
        TreasureData::Command::List.show_guess(cmd)
        exit 1
      end

      begin
        method.call
      rescue TreasureData::ConfigError
        $stderr.puts "TreasureData account is not configured yet."
        $stderr.puts "Run '#{$prog} account' first."
      rescue
        $stderr.puts "error #{$!.class}: backtrace:"
        $!.backtrace.each {|b|
          $stderr.puts "  #{b}"
        }
        puts ""
        puts $!
      end
    end
  end

end
