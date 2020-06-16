require 'tty-config'
module CloudCord
  class App
    attr_reader :config

    def initialize
      @config = TTY::Config.new
      @config.filename = 'config'
      @config.extname = '.yml'
      @config.prepend_path Pathname.new(Dir.home).join('.cloud_cord')
    end
    def start
      CloudCord::Bot.start
    end
  end
  class CloudDB
    attr_reader :db

    def initialize
      @db = TTY::Config.new
      @db.filename = 'db'
      @db.extname = '.yml'
      @db.prepend_path Pathname.new(Dir.home).join('.cloud_cord')
    end
    def write
      if @config.exist?
        @config.write(Pathname.new(Dir.home).join('.cloud_cord'))
      else
        @config.write(Pathname.new(Dir.home).join('.cloud_cord'), force: true)
      end
    end
  end
end
require 'cloud_cord/bot'

