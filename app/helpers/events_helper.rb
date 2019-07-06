module EventsHelper
  def set_event
    @event = Event.find(params[:id]) rescue not_found
  end
  
  def get_all_event
    @events = Event.where("year < ?", 2019).order(year: :desc)
  end
end
