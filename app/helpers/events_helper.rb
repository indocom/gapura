module EventsHelper
  def set_event
    @event = Event.find_by!(year: params[:year]) rescue not_found
  end
  
  def get_all_event
    @events = Event.where("year < ?", 2019).order(year: :desc)
  end
end
