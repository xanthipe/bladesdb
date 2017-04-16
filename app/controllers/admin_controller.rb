class AdminController < ApplicationController
    before_filter :authenticate_user!

    def dashboard
        @character_requests = Character.pending_characters(current_user)
        @guild_change_requests = GuildMembership.pending_guild_memberships(current_user)
        @provisional_guild_memberships = GuildMembership.provisional_guild_memberships(current_user)
        @character_point_adjustments = CharacterPointAdjustment.pending_adjustments(current_user)
        @monster_point_declarations = MonsterPointDeclaration.pending_declarations(current_user)
        @monster_point_adjustments = MonsterPointAdjustment.pending_adjustments(current_user)
        @death_threshold_adjustments = DeathThresholdAdjustment.pending_adjustments(current_user)
        respond_to do |format|
            format.html
        end
    end
    
end
