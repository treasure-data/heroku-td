require 'td'
require 'td/command/td'

module Heroku::Command

  class Td < BaseWithApp
    def index
      puts 'hello world!'
    end
  end

end
