class Message < ActiveRecord::Base
    belongs_to :board
    belongs_to :user
    belongs_to :character
    belongs_to :last_edited_by, :class_name => "User"
    
    validates_presence_of :board_id
    validates_presence_of :user_id
    validates_presence_of :message
    validates_inclusion_of :deleted, :in => [ true, false ]
    validates_presence_of :name, :if => :ic_board_and_no_character?
    validates_presence_of :request_uuid
    validates_absence_of :character_id, :unless => :ic_board?
    validates_absence_of :name, :unless => :ic_board?
    
    auto_strip_attributes :name, :message
    
    def ic_board_and_no_character?
        return self.board.in_character && self.character == nil
    end
    
    def ic_board?
        return self.board.in_character
    end
    
    def display_creation_time
        created_at.localtime
    end
    
    def display_edited_time
        updated_at.localtime
    end
    
    def duplicate?
        Message.where(request_uuid: request_uuid, user_id: user_id).exists?
    end
end
