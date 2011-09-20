# heroku gem version check
if Heroku::VERSION < '2.0.0'
  puts "Please upgrade your Heroku gem"
elsif Heroku::VERSION >= '3.0.0'
  puts "Please update your heroku-rds plugin"
else
  require 'heroku/commands/td'
end
