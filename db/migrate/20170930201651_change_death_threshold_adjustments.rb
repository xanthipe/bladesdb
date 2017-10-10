class ChangeDeathThresholdAdjustments < ActiveRecord::Migration
  def change
    change_table :death_threshold_adjustments do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_approval_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
      t.references :user
    end
  end
end
