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

    cpas = ActiveRecord::Base.connection.select_all("SELECT * FROM character_point_adjustments")
    cpas.each { |cpa|
      if cpa["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{cpa["approved_by_id"]}, '#{DateTime.parse(cpa["approved_at"]).strftime("%F")}', '#{cpa["approved"]}', 'No reason given.', #{cpa["id"]}, 'CharacterPointAdjustment')")
      elsif cpa["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{cpa["approved_by_id"]}, '#{DateTime.parse(cpa["approved_at"]).strftime("%F")}', '#{cpa["approved"]}', NULL, #{cpa["id"]}, 'CharacterPointAdjustment')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, NULL, #{cpa["id"]}, 'CharacterPointAdjustment')")
      end
    }

    dtas = ActiveRecord::Base.connection.select_all("SELECT * FROM death_threshold_adjustments")
    dtas.each { |dta|
      if dta["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{dta["approved_by_id"]}, '#{DateTime.parse(dta["approved_at"]).strftime("%F")}', '#{dta["approved"]}', 'No reason given.', #{dta["id"]}, 'DeathThresholdAdjustment')")
      elsif dta["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{dta["approved_by_id"]}, '#{DateTime.parse(dta["approved_at"]).strftime("%F")}', '#{dta["approved"]}', NULL, #{dta["id"]}, 'DeathThresholdAdjustment')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, NULL, #{dta["id"]}, 'DeathThresholdAdjustment')")
      end
    }

    gapps = ActiveRecord::Base.connection.select_all("SELECT * FROM game_applications")
    gapps.each { |gapp|
      if gapp["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (2, 7, '#{DateTime.parse(gapp["updated_at"]).strftime("%F")}', '#{gapp["approved"]}', 'No reason given.', #{gapp["id"]}, 'GameApplication')")
      elsif gapp["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (2, 7, '#{DateTime.parse(gapp["updated_at"]).strftime("%F")}', '#{gapp["approved"]}', NULL, #{gapp["id"]}, 'GameApplication')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (2, NULL, NULL, NULL, NULL, #{gapp["id"]}, 'GameApplication')")
      end
    }

    gmems = ActiveRecord::Base.connection.select_all("SELECT * FROM guild_memberships")
    gmems.each { |gmem|
      unless gmem["approved"].nil?
        gmem["approved_by_id"] = 7 if gmem["approved_by_id"].nil?
        if gmem["approved_at"].nil?
          gmem["approved_on"] = DateTime.parse(gmem["updated_at"]).strftime("%F")
        else
          gmem["approved_on"] = DateTime.parse(gmem["approved_at"]).strftime("%F")
        end
      end
      if gmem["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{gmem["approved_by_id"]}, '#{gmem["approved_on"]}', '#{gmem["approved"]}', 'No reason given.', #{gmem["id"]}, 'GuildMembership')")
      elsif gmem["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{gmem["approved_by_id"]}, '#{gmem["approved_on"]}', '#{gmem["approved"]}', NULL, #{gmem["id"]}, 'GuildMembership')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, NULL, #{gmem["id"]}, 'GuildMembership')")
      end
    }

    mpas = ActiveRecord::Base.connection.select_all("SELECT * FROM monster_point_adjustments")
    mpas.each { |mpa|
      if mpa["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{mpa["approved_by_id"]}, '#{DateTime.parse(mpa["approved_at"]).strftime("%F")}', '#{mpa["approved"]}', 'No reason given.', #{mpa["id"]}, 'MonsterPointAdjustment')")
      elsif mpa["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{mpa["approved_by_id"]}, '#{DateTime.parse(mpa["approved_at"]).strftime("%F")}', '#{mpa["approved"]}', NULL, #{mpa["id"]}, 'MonsterPointAdjustment')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, NULL, #{mpa["id"]}, 'MonsterPointAdjustment')")
      end
    }

    mpds = ActiveRecord::Base.connection.select_all("SELECT * FROM monster_point_declarations")
    mpds.each { |mpd|
      if mpd["approved"] == 'f'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{mpd["approved_by_id"]}, '#{DateTime.parse(mpd["approved_at"]).strftime("%F")}', '#{mpd["approved"]}', 'No reason given.', #{mpd["id"]}, 'MonsterPointDeclaration')")
      elsif mpd["approved"] == 't'
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, #{mpd["approved_by_id"]}, '#{DateTime.parse(mpd["approved_at"]).strftime("%F")}', '#{mpd["approved"]}', NULL, #{mpd["id"]}, 'MonsterPointDeclaration')")
      else
        approval = ActiveRecord::Base.connection.execute("INSERT INTO approvals (role_id, approved_by, approved_on, approved, rejection_reason, approvable_id, approvable_type)
          VALUES (3, NULL, NULL, NULL, NULL, #{mpd["id"]}, 'MonsterPointDeclaration')")
      end
    }

  end
end
