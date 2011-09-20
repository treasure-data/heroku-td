require 'td'
require 'td/command/list'

module Heroku::Command

  class Td < BaseWithApp
    def index
      p args
      cmd = args.shift
      p cmd
      puts 'hello world!'
    end
  end

end
