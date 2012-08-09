class Assumption < ActiveRecord::Base
  attr_accessible :assumption, :position, :project_id, :reason, :state
  scope :state, lambda { |state|
     first(:conditions => {:state => state})
  }
  
  scope :state_all, lambda { |state|
    where(:state => state)
  }
  
  belongs_to :project, :class_name => "Project", :foreign_key => "project_id"
  
  state_machine :state, :initial => :pending do

    event :make_current do
      transition all => :current
    end
    
    event :na do
      transition all => :not_applicable
    end
    
    event :accept do
      transition all => :accepted
    end
    
    event :reject do
      transition all => :rejected
    end

    state :current do
      def say
        puts 'hiya'
      end
    end
  end
end
