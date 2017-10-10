class CharacterPointAdjustment < ActiveRecord::Base
  includes Approvable

    belongs_to :character

    validates_presence_of :character_id
    validates_presence_of :points
    validates_numericality_of :points, :only_integer => true

    validates_each :declared_on, on: :save do |record, attr, value|
        last_mp_spend = record.character.monster_point_spends.last(:order => "spent_on ASC")
        last_date = [record.character.declared_on, (last_mp_spend ? last_mp_spend.spent_on : nil)].compact.max
        record.errors.add attr, "must be more recent than #{last_date}." unless record.declared_on > last_date
    end

    after_update :fix_mp_spend_costs

    auto_strip_attributes :reason

    protected
        def fix_mp_spend_costs
            MonsterPointSpend.fix_after(declared_on, character)
        end

end
