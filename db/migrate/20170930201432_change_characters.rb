class ChangeCharacters < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.remove :guild_id
      t.remove :branch_id
      t.remove :guild_start_points
      t.remove :comment
      t.remove :approved_by_id
      t.remove :approved_on
      t.remove :approved
    end
  end
end
