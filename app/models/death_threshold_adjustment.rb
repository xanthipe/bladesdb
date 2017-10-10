class DeathThresholdAdjustment < ActiveRecord::Base
  includes Approvable

    belongs_to :character

    validates_presence_of :character_id
    validates_presence_of :change
    validates_numericality_of :change, :only_integer => true, :less_than_or_equal_to => 10, :greater_than_or_equal_to => -10

    auto_strip_attributes :reason

end
