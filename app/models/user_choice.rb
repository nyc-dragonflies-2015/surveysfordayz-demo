class UserChoice < ActiveRecord::Base
  belongs_to :choice
  belongs_to :taken_survey

  def self.count_choice_by_id(id)
    UserChoice.where(choice_id: id).count
  end
end
