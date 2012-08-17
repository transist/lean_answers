class IncomingEmail < Email  
  state_machine :state, :initial => :unprocessed do

  end
  
  def process
    
  end
end
