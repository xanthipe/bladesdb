class CreateJoinTableApplicationGamesMasters < ActiveRecord::Migration
  def change
    create_join_table :applications, :users, table_name: :application_games_masters do |t|
      # t.index [:application_id, :user_id]
      # t.index [:user_id, :application_id]
    end
  end
end
