class Attendance < ApplicationRecord
  belongs_to :classroom
  belongs_to :user
end
