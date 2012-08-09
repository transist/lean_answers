class Email < ActiveRecord::Base
  attr_accessible :bcc, :cc, :from, :html_version, :subject, :text_version, :to, :email_options, :reply_to_name, :reply_to_address, :css
  
  state_machine :state, :initial => :new do
    event :send_email do
      transition [:unsent, :new] => :sent
    end
    
    event :send_failure do
      transition [:unsent, :new] => :failed
    end
  end
  
  def setup_text
    Document.new(self.text_version).interpolate(self.email_options)
  end
  
  def setup_css
    css = ''
    css += style_tag(Email.bootstrap_css) if self.include_bootstrap_css
    css += style_tag(self.css) if self.css    
    css
  end
  
  def style_tag(css)
    "<style>\n\n"+ css + "\n</style>\n\n"
  end
  
  def setup_html
    template = setup_css + self.html_version
    Premailer.new(Document.new(template).interpolate(self.email_options), {:with_html_string => true}).to_inline_css
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
    params = setup_params
    EmailYak::Email.send(params)
    self.send_email
    self
  rescue => e
    self.failure_message = e.to_s
    self.send_failure
    self
  end
  
  def self.bootstrap_css
    @bootstrap_css ||= File.read(Rails.root.to_s+"/app/assets/stylesheets/bootstrap.css.scss")
    @bootstrap_css
  end
end
