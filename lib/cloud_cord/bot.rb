require 'discordrb'
require 'cloud_cord/commands/owner'
module CloudCord
  module Bot
    @@cfg = CloudCord::App.new.config.read
    @@bot = Discordrb::Commands::CommandBot.new token: @@cfg.fetch('bot').fetch('discord').fetch('token'), prefix: @@cfg.fetch('bot').fetch('prefix')
# Discord commands
    module DiscordCommands
      ;
    end

    Dir['lib/cloud_cord/commands/*.rb'].each do |file|
      load file
      puts "Loaded Command file: #{file}"
    end
    DiscordCommands.constants.each do |file|
      puts "Included Command file #{file}"
      @@bot.include! DiscordCommands.const_get file
    end

# Discord events
    module DiscordEvents
      ;
    end

    Dir['lib/cloud_cord/events/*.rb'].each do |file|
      load file
      puts "Loaded Event file: #{file}"
    end
    DiscordEvents.constants.each do |file|
      @@bot.include! DiscordEvents.const_get file
      puts "Included Event file #{file}"
    end


    module_function
    def self.start
      @@bot.run
    rescue Interrupt
      @@bot.stop
    end
    def self.bot
      CloudCord::Bot.class_variable_get(:@@bot)
    end

  end
end