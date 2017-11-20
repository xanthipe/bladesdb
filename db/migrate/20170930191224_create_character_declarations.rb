class CreateCharacterDeclarations < ActiveRecord::Migration
  def change
    create_table :character_declarations do |t|
      t.references :user, :null => false
      t.references :character, :null => false
      t.date :declared_on, :null => false, :default => Date.today
      t.string :name, :null => false
      t.references :race, :null => false
      t.references :guild, :null => true
      t.references :guild_branch, :null => true
      t.integer :guild_start_points, :null => true
      t.integer :starting_points, :null => false, :default => 20
      t.integer :starting_florins, :null => false, :default => 0
      t.integer :starting_death_thresholds, :null => false
      t.string :reason
      t.date :decision_date
      t.boolean :overall_decision_status
    end

    characters = ActiveRecord::Base.connection.select_all("SELECT * FROM characters WHERE state != 'undeclared'")
    characters.each { |character|
      guild = ActiveRecord::Base.connection.select_all("SELECT * FROM guild_memberships WHERE character_id = #{character["id"]} ORDER BY declared_on DESC LIMIT 1").first
      guild["guild_id"] = 'NULL' if guild["guild_id"].nil?
      guild["guild_branch_id"] = 'NULL' if guild["guild_branch_id"].nil?
      guild["start_points"] = 0 if guild["start_points"].nil?
      character_dec = ActiveRecord::Base.connection.execute("INSERT INTO character_declarations (user_id, character_id, declared_on, name, race_id, guild_id, guild_branch_id, guild_start_points, starting_points, starting_florins,
        starting_death_thresholds, decision_date, overall_decision_status, reason)
        VALUES (#{character["user_id"]}, #{character["id"]}, '#{character["declared_on"]}',#{Character.connection.quote(character["name"])}, #{character["race_id"]}, #{guild["guild_id"]}, #{guild["guild_branch_id"]},
        #{guild["start_points"]}, #{character["starting_points"]}, #{character["starting_florins"]}, #{character["starting_death_thresholds"]}, '#{character["approved_on"]}', '#{character["approved"]}', 'Character creation/declaration.')")
      declaration = ActiveRecord::Base.connection.select_all("SELECT * FROM character_declarations WHERE character_id = #{character["id"]}").first
      if character["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{character["approved_by_id"]}, '#{DateTime.parse(character["approved_on"]).strftime("%F")}', '#{character["approved"]}', 'No reason given.', #{declaration["id"]}, 'CharacterDeclaration')")
        if character["state"] != "recycled"
          membership = ActiveRecord::Base.connection.execute("DELETE FROM guild_memberships WHERE id=#{guild["id"]}")
          membership_approvals = ActiveRecord::Base.connection.execute("DELETE FROM approvals WHERE approvable_id=#{guild["id"]} AND approvable_type='GuildMembership'")
          undeclared_char = ActiveRecord::Base.connection.execute("UPDATE characters SET
                                                                    state = 'undeclared',
                                                                    race_id = 1,
                                                                    starting_points = 20,
                                                                    starting_florins = 0,
                                                                    starting_death_thresholds = 10,
                                                                    biography = NULL,
                                                                    date_of_birth = NULL,
                                                                    date_of_birth_public = NULL,
                                                                    address = NULL,
                                                                    title = NULL,
                                                                    notes = NULL,
                                                                    player_notes = NULL,
                                                                    gm_notes = NULL,
                                                                    declared_on = '2010-04-19',
                                                                    no_title = 'f',
                                                                    preferred_character = 'f'
                                                                  WHERE id = #{character["id"]}")
        end
      elsif character["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{character["approved_by_id"]}, '#{DateTime.parse(character["approved_on"]).strftime("%F")}', '#{character["approved"]}', NULL, #{declaration["id"]}, 'CharacterDeclaration')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, NULL, #{declaration["id"]}, 'CharacterDeclaration')")
      end
    }
  end
end
