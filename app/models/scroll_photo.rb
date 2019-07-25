class ScrollPhoto < ApplicationRecord
  default_scope { order('year DESC') }
end
