module Network

  def self.email_connect(host, port, email, password)
    begin
      Net::SMTP.start(host, port, email.split("@").last,
                email, password, :login)
      { sucess: true, message: 'Valid Password!' }
    rescue Exception => ex
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

  def self.ftp_connect(server, user, password)
    begin
      ftp = Net::FTP.new(server)
      ftp.login(user, password)
      { sucess: true, message: 'Valid Password!' }
    rescue Exception => ex
      case ex
        when ex.to_s.include? "Net::FTPReplyError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::FTPTempError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::FTPPermError"
          { sucess: false, message: '' }
        when ex.to_s.include? "Net::FTPProtoError"
          { sucess: false, message: '' }
      end
    ensure
      ft.exit()
    end

  end
  
end