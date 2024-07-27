class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :role, presence: true, inclusion: { in: %w[user admin] }

  has_many :adoptions
  has_many :adopted_dogs, through: :adoptions, source: :dog
  has_many :adopted_cats, through: :adoptions, source: :cat

  def admin?
    role == 'admin'
    
  end
       
  def user?
    role == 'user'
  end
end
