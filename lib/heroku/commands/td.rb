require 'td'
require 'td/command/list'

module Heroku::Command

  class Td < BaseWithApp
    def index
      cmd = args.shift
      unless cmd
        # TODO: show usage
        return -1
      end

      method = TreasureData::Command::List.get_method(cmd)
      p method
      unless method
        $stderr.puts "'#{cmd}' is not a td command. Run '#{$prog}' to show the list."
        TreasureData::Command::List.show_guess(cmd)
        exit 1
      end
      puts 'hello world!'
    end
  end

end
