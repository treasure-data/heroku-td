module Heroku::Command

  class Td < BaseWithApp
    def index
      puts 'hello world!'
    end

    def db:create
      puts 'comma test'
    end
  end

end
