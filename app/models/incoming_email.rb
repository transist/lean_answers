class IncomingEmail < Email  
  state_machine :state, :initial => :unread do

  end
end
