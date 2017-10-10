class MonsterPointAdjustment < ActiveRecord::Base
  includes Approvable

    validates_presence_of :points
    validates_presence_of :reason
    validates_numericality_of :points, :only_integer => true
    validates_date :declared_on, :on_or_before => Date.today

    auto_strip_attributes :reason

end
