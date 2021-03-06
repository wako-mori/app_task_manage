class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 8 },on: :create

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :tasks
end
