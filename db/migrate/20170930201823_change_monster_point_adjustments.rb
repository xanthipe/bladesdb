class ChangeMonsterPointAdjustments < ActiveRecord::Migration
  def change
    change_table :monster_point_adjustments do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_approval_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
    end
  end
end
