class CreateCharacterRecyclings < ActiveRecord::Migration
  def change
    create_table :character_recyclings do |t|
      t.references :character
      t.references :user
      t.string :reason
      t.date :decision_date
      t.boolean :overall_decision_status
    end
  end
end
