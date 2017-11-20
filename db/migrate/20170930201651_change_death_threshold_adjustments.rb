class ChangeDeathThresholdAdjustments < ActiveRecord::Migration
  def change
    change_table :death_threshold_adjustments do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_decision_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
      t.references :user
    end

    approvals = ActiveRecord::Base.connection.select_all("SELECT * FROM approvals WHERE approvable_type = 'DeathThresholdAdjustment'")
    approvals.each { |approval|
      dta = ActiveRecord::Base.connection.select_all("SELECT * FROM death_threshold_adjustments WHERE id = #{approval["approvable_id"]}").first
      character = ActiveRecord::Base.connection.select_all("SELECT * FROM characters WHERE id = #{dta["character_id"]}").first
      if approval["approved"].nil?
        dta = ActiveRecord::Base.connection.execute("UPDATE death_threshold_adjustments SET
          decision_date = NULL,
          reason = 'Death threshold adjustment.',
          user_id = '#{character["user_id"]}'
          WHERE id = #{approval["approvable_id"]}")
      else
        dta = ActiveRecord::Base.connection.execute("UPDATE death_threshold_adjustments SET
          decision_date = '#{approval["approved_on"]}',
          reason = 'Death threshold adjustment.',
          user_id = '#{character["user_id"]}'
          WHERE id = #{approval["approvable_id"]}")
      end
    }

  end
end
