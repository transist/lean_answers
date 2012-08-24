class Hypothesis < ActiveRecord::Base
  attr_accessible :content, :project_id, :type, :state, :reason, :mark_as_current_after_create
  belongs_to :project

  attr_accessor :mark_as_current_after_create

  scope :state, lambda { |state|
     first(conditions: {state: state})
   }

   scope :state_all, lambda { |state|
      where(state: state)
    }
   scope :class_type, lambda { |t|
      where(type: t)
    }


  after_create :make_current

  state_machine :state, initial: :backlogged do
    before_transition any => :current, do: :pend_other_hypotheses

    event :make_current do
      transition all => :current, if: :mark_as_current_after_create
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

    state :current do
      def say
        puts 'hiya'
      end
    end
  end

  def mark_as_current_after_create
    @mark_as_current_after_create = true if @mark_as_current_after_create.nil?
    if %w(1 true).include?(@mark_as_current_after_create.to_s)
      true
    else
      false
    end
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

