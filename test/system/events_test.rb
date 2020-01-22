# frozen_string_literal: true

require 'application_system_test_case'

class EventsTest < ApplicationSystemTestCase
  setup { @event = events(:one) }

  test 'visiting the index' do
    visit events_url
    assert_selector 'h1', text: 'Events'
  end

  test 'creating an Event' do
    visit events_url
    click_on 'New Event'

    click_on 'Create Event'

    assert_text 'Event was successfully created'
    click_on 'Back'
  end

  test 'updating an Event' do
    visit events_url
    click_on 'Edit', match: :first

    click_on 'Update Event'

    assert_text 'Event was successfully updated'
    click_on 'Back'
  end

  test 'destroying an Event' do
    visit events_url
    page.accept_confirm { click_on 'Destroy', match: :first }

    assert_text 'Event was successfully destroyed'
  end
end
