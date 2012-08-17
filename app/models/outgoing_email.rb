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
