class Survey < ActiveRecord::Base
  has_many :taken_surveys
  has_many :questions
  belongs_to :user
end
