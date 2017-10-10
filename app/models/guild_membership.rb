class GuildMembership < ActiveRecord::Base
  includes Approvable

    belongs_to :character
    belongs_to :guild
    belongs_to :guild_branch

    validates_presence_of :character_id
    validates_presence_of :guild_branch_id, :unless => "guild_id.nil? || guild.guild_branches.empty?"
    validates_numericality_of :start_points, :only_integer => true, :greater_than_or_equal_to => 0, :allow_nil => true
    validate :guild_start_points_less_than_or_equal_to_total_points
    validate :guild_or_branch_are_different_to_previous, on: :create

    def start_rank
        calculated_start_points / 10.0
    end

    def calculated_start_points
        if start_points.nil?
            character.points_on(declared_on || Date.today)
        else
            start_points
        end
    end

    def full_guild_name
        case
        when guild.nil? then ""
        when guild_branch.nil? then guild.name
        else "#{guild.name} - #{guild_branch.name}"
        end
    end

    protected
        def guild_start_points_less_than_or_equal_to_total_points
            errors.add(:start_points, I18n.t("character.guild_membership.failure.more_than_character_points")) unless start_points.nil? or character.starting_points.nil? or start_points <= character.starting_points
        end

        def guild_or_branch_are_different_to_previous
            unless character.guild_memberships.empty? or self == character.guild_memberships[0]
                errors.add(:base, I18n.t("character.guild_membership.failure.no_change")) if character.current_guild_membership.guild == guild and character.current_guild_membership.guild_branch == guild_branch and !character.current_guild_membership.provisional
            end
        end

        def is_starting_guild?
            start_points == 0
        end
end
