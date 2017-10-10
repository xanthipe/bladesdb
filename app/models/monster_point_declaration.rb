class MonsterPointDeclaration < ActiveRecord::Base
  includes Approvable

    validates_presence_of :points
    validates_numericality_of :points, :only_integer => true, :greater_than_or_equal_to => 0
    validates_date :declared_on, :on_or_before => Date.today

end
