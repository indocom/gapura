# frozen_string_literal: true

module EventsHelper
  def set_event
    not_found && return if params[:year].to_i >= current_year
    @event =
      begin
        Event.find_by!(year: params[:year])
      rescue StandardError
        not_found
      end
  end

  def get_all_event
    @events = Event.where('year < ?', current_year).order(year: :desc)
  end # rubocop:todo Naming/AccessorMethodName
end
