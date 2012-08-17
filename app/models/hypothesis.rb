# == Schema Information
#
# Table name: hypotheses
#
#  id         :integer          not null, primary key
#  content    :text
#  type       :string(255)
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :string(255)
#  reason     :text
#

class Hypothesis < ActiveRecord::Base
  attr_accessible :content, :project_id, :type, :state, :reason
  belongs_to :project
  scope :state, lambda { |state|
     first(:conditions => {:state => state})
   }
   
   scope :state_all, lambda { |state|
      where(:state => state)
    }
   scope :class_type, lambda { |t|
      where(:type => t)
    }
  
  def after_create
    make_current
  end
  
  state_machine :state, :initial => :pending do
    before_transition any => :current, :do => :pend_other_hypotheses
    # 
    # after_transition :on => :crash, :do => :tow
    # after_transition :on => :repair, :do => :fix
    # after_transition any => :parked do |vehicle, transition|
    #   vehicle.seatbelt_on = false
    # end
    # 
    # after_failure :on => :ignite, :do => :log_start_failure
    # 
    # around_transition do |vehicle, transition, block|
    #   start = Time.now
    #   block.call
    #   vehicle.time_used += Time.now - start
    # end
    # 
    event :make_current do
      transition all => :current
    end
    
    event :pend do
      transition all => :pending
    end
    
    event :accept do
      transition all => :accepted
    end
    
    event :reject do
      transition all => :rejected
    end
    # 
    # event :ignite do
    #   transition :stalled => same, :parked => :idling
    # end
    # 
    # event :idle do
    #   transition :first_gear => :idling
    # end
    # 
    # event :shift_up do
    #   transition :idling => :first_gear, :first_gear => :second_gear, :second_gear => :third_gear
    # end
    # 
    # event :shift_down do
    #   transition :third_gear => :second_gear, :second_gear => :first_gear
    # end
    # 
    # event :crash do
    #   transition all - [:parked, :stalled] => :stalled, :if => lambda {|vehicle| !vehicle.passed_inspection?}
    # end
    # 
    # event :repair do
    #   # The first transition that matches the state and passes its conditions
    #   # will be used
    #   transition :stalled => :parked, :unless => :auto_shop_busy
    #   transition :stalled => same
    # end
    # 
    state :current do
      def say
        puts 'hiya'
      end
    end
    # 
    # state :idling, :first_gear do
    #   def speed
    #     10
    #   end
    # end
    # 
    # state all - [:parked, :stalled, :idling] do
    #   def moving?
    #     true
    #   end
    # end
    # 
    # state :parked, :stalled, :idling do
    #   def moving?
    #     false
    #   end
    # end
  end
  
  def ensure_current
    if self.state == 'current' && self.project.hypotheses.class_type(self.class.to_s).state_all('current').size <= 1 && self.project.hypotheses.class_type(self.class.to_s).state_all('pending').size  >= 1
      puts self.project.hypotheses.class_type(self.class.to_s).state_all('pending').last.inspect
      self.project.hypotheses.class_type(self.class.to_s).state_all('pending').last.make_current 
    end
  end
  
  def pend_other_hypotheses
    puts "::::::::::::::::::::::::::::::::::::::::::::: pending "
    self.project.hypotheses.each do |h|
      if h.state == 'current' && self.type == h.type && h != self
        h.pend
      end
    end
  end
end
