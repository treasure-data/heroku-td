require 'td'
require 'td/command/list'

module Heroku::Command

  class Td < BaseWithApp
    def index
      puts 'hello world!'
    end
  end

end
