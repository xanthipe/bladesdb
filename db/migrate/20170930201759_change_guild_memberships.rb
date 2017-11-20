class ChangeGuildMemberships < ActiveRecord::Migration
  def change
    change_table :guild_memberships do |t|
      t.rename :comment, :reason
      t.rename :approved, :overall_decision_status
      t.remove :approved_at
      t.remove :approved_by_id
      t.date :decision_date
      t.references :user
    end

    approvals = ActiveRecord::Base.connection.select_all("SELECT * FROM approvals WHERE approvable_type = 'GuildMembership'")
    approvals.each { |approval|
      gmem = ActiveRecord::Base.connection.select_all("SELECT * FROM guild_memberships WHERE id = #{approval["approvable_id"]}").first
      character = ActiveRecord::Base.connection.select_all("SELECT * FROM characters WHERE id = #{gmem["character_id"]}").first
      if approval["approved"].nil?
        gmem = ActiveRecord::Base.connection.execute("UPDATE guild_memberships SET
          decision_date = NULL,
          reason = 'Guild membership change.',
          user_id = '#{character["user_id"]}'
          WHERE id = #{approval["approvable_id"]}")
      else
        gmem = ActiveRecord::Base.connection.execute("UPDATE guild_memberships SET
          decision_date = '#{approval["approved_on"]}',
          reason = 'Guild membership change.',
          user_id = '#{character["user_id"]}'
          WHERE id = #{approval["approvable_id"]}")
      end
    }

  end
end
