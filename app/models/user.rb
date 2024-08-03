class User < ApplicationRecord
  has_one_attached :photo
  has_many :classrooms_as_student, through: :attendances, source: :classrooms
  has_many :classrooms
  has_many :feedbacks
  has_many :submissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
