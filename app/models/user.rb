class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation
	rolify
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
