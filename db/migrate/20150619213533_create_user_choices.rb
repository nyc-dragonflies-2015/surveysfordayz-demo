class CreateUserChoices < ActiveRecord::Migration
  def change
    create_table :user_choices do |t|
      t.references :taken_survey, :choice

      t.timestamps null: false
    end
  end
end
