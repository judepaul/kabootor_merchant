require "opentok"

module OpentokUtils
  
  def create_opentok_session
      tries = 5
    begin
        opentok = OpenTok::OpenTok.new ENV['TOK_BOX_API_KEY'], ENV['TOK_BOX_API_SECRET']
        session = opentok.create_session(:media_mode => :routed)
        logger.debug "opentok connected."
    rescue Exception => e 
        logger.error e 
        tries -= 1
          if tries > 0
            logger.debug "retrying opentok.new..."
            retry 
          else
             logger.debug "opentok.new timed out..."
              puts "ERROR: #{e.message}" 
          end
    end
    session
  end
  
  def init_opentok
    @opentok = OpenTok::OpenTok.new(ENV['TOK_BOX_API_KEY'], ENV['TOK_BOX_API_SECRET'])
  end
  
  def api_key
    @api_key = ENV['TOK_BOX_API_KEY']
  end
  
end