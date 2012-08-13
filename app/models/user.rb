class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password  
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  has_many :memberships
  has_many :projects, :through => :memberships
  has_many :task_assignments
  has_many :tasks, :through => :task_assignments
  
  def admin?
    true
  end
end
