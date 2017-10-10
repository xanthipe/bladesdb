class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :role_id
      t.integer :approved_by
      t.date :approved_on
      t.boolean :approved
      t.string :rejection_reason
      t.references :approvable, polymorphic: true, index: true
    end
  end
end
