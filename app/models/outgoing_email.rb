class OutgoingEmail < Email  
  state_machine :state, :initial => :unsent do

  end
  
  def send!
    params = setup_params
    EmailYak::Email.send(params)
    self.send_email
    self
  rescue => e
    puts e.inspect
    self.failure_message = e.to_s
    self.send_failure
    self
  end
end

# == Schema Information
#
# Table name: emails
#
#  id                    :integer          not null, primary key
#  to                    :text
#  from                  :text
#  cc                    :text
#  bcc                   :text
#  subject               :text
#  text_version          :text
#  html_version          :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  state                 :string(255)
#  type                  :string(255)
#  email_options         :text
#  reply_to_name         :string(255)
#  reply_to_address      :string(255)
#  include_bootstrap_css :boolean          default(TRUE)
#  css                   :text
#  failure_message       :text
#  name                  :string(255)
#

