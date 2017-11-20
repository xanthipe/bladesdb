class ChangeMonsterPointAdjustments < ActiveRecord::Migration
  def change
    change_table :monster_point_adjustments do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_decision_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
    end

    approvals = ActiveRecord::Base.connection.select_all("SELECT * FROM approvals WHERE approvable_type = 'MonsterPointAdjustment'")
    approvals.each { |approval|
      if approval["approved"].nil?
        mpa = ActiveRecord::Base.connection.execute("UPDATE monster_point_adjustments SET
          decision_date = NULL,
          reason = 'Monster point adjustment.'
          WHERE id = #{approval["approvable_id"]}")
      else
        mpa = ActiveRecord::Base.connection.execute("UPDATE monster_point_adjustments SET
          decision_date = '#{approval["approved_on"]}',
          reason = 'Monster point adjustment.'
          WHERE id = #{approval["approvable_id"]}")
      end
    }

  end
end
