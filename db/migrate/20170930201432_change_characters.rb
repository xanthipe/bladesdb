class ChangeCharacters < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.remove :comment
      t.remove :approved_by_id
      t.remove :approved_on
      t.remove :approved
    end
  end
end
