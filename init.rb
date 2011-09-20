begin
  require 'td/command/runner'
rescue LoadError
  raise "'td' gem is missing.  Please install td: gem install td"
end

require File.dirname(__FILE__) + '/lib/heroku/td'

