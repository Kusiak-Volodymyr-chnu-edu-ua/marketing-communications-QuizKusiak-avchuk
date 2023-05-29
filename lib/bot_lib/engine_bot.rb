class EngineBot
    def initialize
      @config = AppConfigurator.new
    end
  
    def run
        @config.configure
        
        token = @config.get_token
        logger = @config.get_logger
        
        logger.debug 'Starting telegram bot'
        
        Telegram::Bot::Client.run(token) do |bot|
          bot.listen do |message|
            options = {bot: bot, message: message}
        
            logger.debug "@#{message.from.username}: #{message.text}" 
            MessageResponder.new(options).respond
          end
        end
        
    end
end