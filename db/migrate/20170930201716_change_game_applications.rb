class ChangeGameApplications < ActiveRecord::Migration
  def change
    change_table :game_applications do |t|
      t.rename :details, :reason
      t.rename :approved, :overall_decision_status
      t.remove :comment
      t.string :title
      t.integer :lower_rank
      t.integer :upper_rank
      t.boolean :looking_for_gm, null: false, default: false
      t.date :decision_date
      t.date :declared_on
    end

    approvals = ActiveRecord::Base.connection.select_all("SELECT * FROM approvals WHERE approvable_type = 'GameApplication'")
    approvals.each { |approval|
      gdec = ActiveRecord::Base.connection.select_all("SELECT created_at FROM game_applications WHERE id = #{approval["approvable_id"]}").first
      if approval["approved"].nil?
        gapp = ActiveRecord::Base.connection.execute("UPDATE game_applications SET
          decision_date = NULL,
          declared_on = '#{DateTime.parse(gdec["created_at"]).strftime("%F")}'
          WHERE id = #{approval["approvable_id"]}")
      else
        gapp = ActiveRecord::Base.connection.execute("UPDATE game_applications SET
          decision_date = '#{approval["approved_on"]}',
          declared_on = '#{DateTime.parse(gdec["created_at"]).strftime("%F")}'
          WHERE id = #{approval["approvable_id"]}")
      end
    }

  end
end
