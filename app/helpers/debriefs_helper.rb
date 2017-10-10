module DebriefsHelper

  def debrief_close_date game_start_date, game_end_date
    if game_end_date > game_start_date
      close_date = game_start_date + 20.days
    else
      close_date = game_start_date + 13.days
    end
  end

end
