require 'td/command/runner'

module Heroku::Command

  class Td < BaseWithApp
    def index
      r = TreasureData::Command::Runner.new
      r.prog_name = "#{File.basename($0)} td"

      if args.empty?
        # show usage
        r.run args
        exit 0
      end

      # this does internet access
      r.apikey = heroku.config_vars(app)['TREASURE_DATA_API_KEY']

      r.run args
    end
  end

end
