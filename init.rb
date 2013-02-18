begin
  require 'heroku-api'
  require 'heroku/helpers'
rescue LoadError => e
  p e
  $stderr.puts " !    Error: Your heroku toolbelt is too old. Please upgrade from here. > https://toolbelt.heroku.com/"
  exit
end
require File.dirname(__FILE__) + '/lib/heroku/td'
