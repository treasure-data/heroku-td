require 'heroku-api'

# 2012/11/16 Kazuki Ohta <k@treasure-data.com>
# From Dec 2012, Heroku will deprecate `heroku` gem and recommend using Heroku
# toolbelt. That required us to install `td` gem with `ruby` interpreter, which
# is bundled with Heroku toolbelt.
TD_VERSION = '0.10.61'

def install_td_gem
  begin
    puts "Installing required gems for 'heroku td'..."
    Gem::GemRunner.new.run ['install', 'td', '--no-ri', '--no-rdoc', '--version', '0.10.61', '--user-install']
  rescue Gem::SystemExitException => e
    exit e.exit_code
  end
end

begin
  require 'rubygems' unless defined?(gem)
  require 'rubygems/gem_runner'
  require 'rubygems/exceptions'
  $LOAD_PATH.unshift(Gem.user_dir)
  require 'td/client'
  require 'td/command/runner'
  require 'td/version'
  if TreasureData::VERSION != TD_VERSION
    install_td_gem()
  end
rescue LoadError
  install_td_gem()
end

begin
  require 'td/client'
  require 'td/command/runner'
rescue LoadError
  raise "'td' gem is missing.  Please install td: gem install td"
end

require File.dirname(__FILE__) + '/lib/heroku/td'
