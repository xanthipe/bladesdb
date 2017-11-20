class ChangeMonsterPointDeclarations < ActiveRecord::Migration
  def change
    change_table :monster_point_declarations do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_decision_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
    end

    approvals = ActiveRecord::Base.connection.select_all("SELECT * FROM approvals WHERE approvable_type = 'MonsterPointDeclaration'")
    approvals.each { |approval|
      if approval["approved"].nil?
        mpd = ActiveRecord::Base.connection.execute("UPDATE monster_point_declarations SET
          decision_date = NULL,
          reason = 'Monster point declaration.'
          WHERE id = #{approval["approvable_id"]}")
      else
        mpd = ActiveRecord::Base.connection.execute("UPDATE monster_point_declarations SET
          decision_date = '#{approval["approved_on"]}',
          reason = 'Monster point declaration.'
          WHERE id = #{approval["approvable_id"]}")
      end
    }

  end
end
