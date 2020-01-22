# frozen_string_literal: true

module Admin
  module EventsHelper
    def set_event
      year = params[:year] || params[:event_year]
      @event =
        begin
          Event.find_by!(year: year)
        rescue StandardError
          not_found
        end
    end

    def get_all_event
      @events = Event.all.order(year: :desc)
    end # rubocop:todo Naming/AccessorMethodName
  end
end
