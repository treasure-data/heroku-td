module Heroku::Command

  # manage treasure data hadoop service
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
      r.apikey = api.get_config_vars(app).body['TREASURE_DATA_API_KEY']
      
      r.run args
    end
  end

end
