module Admin
  module EventsHelper
    def set_event
      year = params[:year] ? params[:year] : params[:event_year]
      @event = Event.find_by!(year: year) rescue not_found
    end

    def get_all_event
      @events = Event.all.order(year: :desc)
    end
  end
end
