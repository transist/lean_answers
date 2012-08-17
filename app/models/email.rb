class Email < ActiveRecord::Base
  attr_accessible :bcc, :cc, :from, :html_version, :subject, :text_version, :to, :email_options, :reply_to_name, :reply_to_address, :css
  serialize :email_options
  
  state_machine :state, :initial => :new do
    event :send_email do
      transition [:unsent, :new] => :sent
    end
    
    event :send_failure do
      transition [:unsent, :new] => :failed
    end
  end
  
  def setup_text
    ErbDocument.new(self.text_version).interpolate(self.email_options)
  end
  
  def setup_css
    css = self.header
    css += style_tag(Email.bootstrap_css) if self.include_bootstrap_css
    css += style_tag(self.css) if self.css  
    css += "</head><body>"  
    css
  end
  
  def style_tag(css)
    "<style>\n\n"+ css + "\n</style>\n\n"
  end
  
  def setup_html
    template = setup_css + self.html_version + self.footer
    Premailer.new(ErbDocument.new(template).interpolate(self.email_options), {:with_html_string => true}).to_inline_css
  end
  
  def header
    @header = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'+ 
              '<html xmlns="http://www.w3.org/1999/xhtml">'+
              '<head>'+
              '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'+
              '<meta name="viewport" content="width=device-width, initial-scale=1.0"/>'+
              '<title>Your Message Subject or Title</title>'
    @header
  end
  
  def footer
    '</body></html>'
  end
  
  def setup_params
    params = {
     "ToAddress"=> self.to, 
     "FromName"=> self.reply_to_name, 
     "SenderAddress"=> self.from, 
     "Headers"=> [
       {
         "Name"=> self.reply_to_name, 
         "Value"=> self.from
       }
     ], 
     "ReplyToAddress"=>self.reply_to_address, 
     "FromAddress"=> self.from, 
     "TextBody"=> setup_text, 
     "HtmlBody"=> setup_html,
     "Subject"=> self.subject
    }
    params['CcAddress'] = self.cc if self.cc != nil
    params['BccAddress'] = self.bcc if self.cc != nil
    params
  end
  
  def send!
    raise "Sorry, this class can't use the send! method."
  end
  
  def self.bootstrap_css
    @bootstrap_css ||= File.read(Rails.root.to_s+"/app/assets/stylesheets/bootstrap.css.scss")
    @bootstrap_css
  end
end
