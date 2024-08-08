class User < ApplicationRecord
  has_secure_password
  has_one_attached :photo
  has_many :attendances
  has_many :classrooms_as_student, through: :attendances, source: :classroom
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
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Must be at least 6 characters and contain only letters and numbers" }, if: :password_digest_changed?
end
