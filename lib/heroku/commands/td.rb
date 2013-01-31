module Heroku::Command

  # manage Treasure Data hadoop service
  class Td < BaseWithApp
    def index
      r = Heroku::Command::TdCommandRunner.new
      r.run api.get_config_vars(app).body['TREASURE_DATA_API_KEY'], args
    end
  end

  # run td command (http://toolbelt.treasure-data.com/)
  class TdCommandRunner
    def run(apikey, args)
      ENV['TREASURE_DATA_API_KEY'] = apikey

      begin
        exec("td", *args)
      rescue Errno::ENOENT
        Heroku::Helpers::output_with_bang "Local `td` command could not be located."
        Heroku::Helpers::output_with_bang "To install `td` command, visit and download it from http://toolbelt.treasure-data.com/"
        abort
      end
    end
  end

end
