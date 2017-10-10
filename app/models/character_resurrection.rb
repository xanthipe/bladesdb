class CharacterResurrection < ActiveRecord::Base
  includes Approvable

    belongs_to :character

    validates_presence_of :character_id

end
