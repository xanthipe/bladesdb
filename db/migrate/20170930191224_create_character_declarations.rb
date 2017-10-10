class CreateCharacterDeclarations < ActiveRecord::Migration
  def change
    create_table :character_declarations do |t|
      t.references :user, :null => false
      t.references :character, :null => false
      t.date :declared_on, :null => false, :default => Date.today
      t.string :name, :null => false
      t.references :race, :null => false
      t.references :guild, :null => true
      t.references :guild_branch, :null => true
      t.integer :guild_start_points, :null => true
      t.integer :starting_points, :null => false, :default => 20
      t.integer :starting_florins, :null => false, :default => 0
      t.integer :starting_death_thresholds, :null => false
      t.string :reason
      t.date :decision_date
      t.boolean :overall_decision_status
    end
  end
end
