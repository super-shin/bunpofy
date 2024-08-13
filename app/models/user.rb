class User < ApplicationRecord
  has_one_attached :photo
  has_many :attendances
  has_many :classrooms_as_student, through: :attendances, source: :classroom
  has_many :challenges_as_student, through: :classrooms_as_student, source: :challenges
  has_many :classrooms
  has_many :feedbacks
  has_many :submissions
  has_many :challenges
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :role, :school, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
