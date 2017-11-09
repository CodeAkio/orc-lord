module Network

  def self.email_connect(host, port, email, password)
    require 'net/smtp'
    
    begin
      Net::SMTP.start(host, port, email.split("@").last,
                email, password, :login)
      { sucess: true, message: 'Valid Password!' }
    rescue Exception => ex
      #raise ex
      case ex
        when ex.to_s.include? "Net::SMTPAuthenticationError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::SMTPServerBusy"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::SMTPSyntaxError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::SMTPFatalError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::SMTPUnknownError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::OpenTimeout"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::ReadTimeout"
          { sucess: false, message: '' }
        when ex.to_s.include? "IOError"
          { sucess: false, message: '' }
      end
    end
  end
  
end