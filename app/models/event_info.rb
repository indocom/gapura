class EventInfo < ApplicationRecord
  self.table_name = "event_info"
  belongs_to  :event, foreign_key: :year, primary_key: :year, touch: true
end
