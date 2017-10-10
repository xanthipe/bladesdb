class ChangeGameApplications < ActiveRecord::Migration
  def change
    change_table :game_applications do |t|
      t.rename :details, :reason
      t.rename :approved, :overall_approval_status
      t.remove :comment
      t.string :title
      t.integer :lower_rank
      t.integer :upper_rank
      t.boolean :looking_for_gm, null: false, default: false
      t.date :decision_date
      t.date :declared_on
    end
  end
end
