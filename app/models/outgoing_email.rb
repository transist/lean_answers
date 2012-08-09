class OutgoingEmail < Email  
  state_machine :state, :initial => :unsent do

  end
end
