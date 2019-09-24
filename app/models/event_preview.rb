class EventPreview < ApplicationRecord
    default_scope { order('created_at DESC') }

    has_one :image, as: :imageable, dependent: :destroy
    belongs_to :event, foreign_key: :year, primary_key: :year, touch: true
        
        accepts_nested_attributes_for :image, reject_if: :all_blank, allow_destroy: true

        after_create :fill_image_link , if: Proc.new { |eventPreview|
          eventPreview.image_link.blank? }
      
        private
          def fill_image_link
            if self.image.nil?
              errors.add(:image_link,'have to be provided if you are not attaching an image')
              raise ActiveRecord::RecordInvalid
            end
      
            self.image_link = Rails.application.routes.url_helpers.serve_image_url(self.image)
            self.save
          end
      end
