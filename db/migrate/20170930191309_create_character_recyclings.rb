class CreateCharacterRecyclings < ActiveRecord::Migration
  def change
    create_table :character_recyclings do |t|
      t.references :character
      t.references :user
      t.date :declared_on
      t.string :reason
      t.date :decision_date
      t.boolean :overall_decision_status
    end

    characters = ActiveRecord::Base.connection.select_all("SELECT * FROM characters WHERE state = 'recycled'")
    characters.each { |character|
      character_recyc = ActiveRecord::Base.connection.execute("INSERT INTO character_recyclings (user_id, character_id, declared_on, decision_date, overall_decision_status, reason)
        VALUES (#{character["user_id"]}, #{character["id"]}, '#{character["declared_on"]}','#{character["approved_on"]}', '#{character["approved"]}', 'Character recycle.')")
      recycle = ActiveRecord::Base.connection.select_all("SELECT * FROM character_recyclings WHERE character_id = #{character["id"]}").first
      if character["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{character["approved_by_id"]}, '#{DateTime.parse(character["approved_on"]).strftime("%F")}', '#{character["approved"]}', NULL, #{recycle["id"]}, 'CharacterRecycle')")
      elsif character["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{character["approved_by_id"]}, '#{DateTime.parse(character["approved_on"]).strftime("%F")}', '#{character["approved"]}', 'No reason given.', #{recycle["id"]}, 'CharacterRecycle')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, 'No reason given.', #{recycle["id"]}, 'CharacterRecycle')")
      end
    }

  end
end
