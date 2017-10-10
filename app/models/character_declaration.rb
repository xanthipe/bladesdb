class CharacterDeclaration < ActiveRecord::Base
  includes Approvable

    belongs_to :character
    belongs_to :race

    validates_presence_of :character_id
    validates_presence_of :race_id
    validates_presence_of :name
    validates_presence_of :starting_points
    validates_numericality_of :starting_points, :greater_than_or_equal_to => 20
    validates_presence_of :starting_florins
    validates_numericality_of :starting_florins
    validates_presence_of :starting_death_thresholds
    validates_numericality_of :starting_death_thresholds, :only_integer => true
    validates_each :starting_death_thresholds do |record, attr, value|
        max_dt = record.race.death_thresholds
        record.errors.add attr, I18n.t("character.validation.dts_greater_than_race") unless (record.starting_death_thresholds || 0) <= record.race.death_thresholds
        record.errors.add attr, I18n.t("character.validation.dts_less_than_zero") unless (record.starting_death_thresholds || 0) >= 0
    end

    auto_strip_attributes :name

end
