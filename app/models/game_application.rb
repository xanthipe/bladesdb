class GameApplication < ActiveRecord::Base
  includes Approvable

    belongs_to :game

    has_and_belongs_to_many :application_gamesmasters, :class_name => "User", :join_table => :application_games_masters

    validates_presence_of :game_id
    validates_numericality_of :lower_rank, :unless => "lower_rank.nil?"
    validates_numericality_of :upper_rank, :unless => "upper_rank.nil?"

    auto_strip_attributes :details, :title


    def reset
        self.approved = nil
        self.comment = nil
    end

end
