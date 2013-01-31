# heroku gem version check
if Heroku::VERSION < '2.0.0'
  puts "Please upgrade your Heroku gem"
else
  require 'heroku/commands/td'
end
