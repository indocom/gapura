module Admin::EventsHelper
  def set_event
    @event = Event.find_by!(year: params[:event_year]) rescue not_found
  end
end
