module EventsHelper
  def set_event
    not_found && return if (params[:year].to_i >= current_year)
    @event = Event.find_by!(year: params[:year]) rescue not_found
  end
  
  def get_all_event
    @events = Event.where("year < ?", current_year).order(year: :desc)
  end
end
