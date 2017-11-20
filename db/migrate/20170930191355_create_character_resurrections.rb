class CreateCharacterResurrections < ActiveRecord::Migration
  def change
    create_table :character_resurrections do |t|
      t.references :character
      t.references :user
      t.date :declared_on
      t.string :reason
      t.date :decision_date
      t.boolean :overall_decision_status
    end
  end
end
