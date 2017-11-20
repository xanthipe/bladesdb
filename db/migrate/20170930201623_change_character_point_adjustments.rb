class ChangeCharacterPointAdjustments < ActiveRecord::Migration
  def change
    change_table :character_point_adjustments do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_decision_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
      t.references :user
    end

    approvals = ActiveRecord::Base.connection.select_all("SELECT * FROM approvals WHERE approvable_type = 'CharacterPointAdjustment'")
    approvals.each { |approval|
      cpa = ActiveRecord::Base.connection.select_all("SELECT * FROM character_point_adjustments WHERE id = #{approval["approvable_id"]}").first
      character = ActiveRecord::Base.connection.select_all("SELECT * FROM characters WHERE id = #{cpa["character_id"]}").first
      if approval["approved"].nil?
        cpa = ActiveRecord::Base.connection.execute("UPDATE character_point_adjustments SET
          decision_date = NULL,
          reason = 'Character point adjustment.',
          user_id = '#{character["user_id"]}'
          WHERE id = #{approval["approvable_id"]}")
      else
        cpa = ActiveRecord::Base.connection.execute("UPDATE character_point_adjustments SET
          decision_date = '#{DateTime.parse(approval["approved_on"]).strftime("%F")}',
          reason = 'Character point adjustment.',
          user_id = '#{character["user_id"]}'
          WHERE id = #{approval["approvable_id"]}")
      end
    }

  end
end
