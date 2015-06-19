class TakenSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :user_choice
end
