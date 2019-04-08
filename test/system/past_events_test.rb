require "application_system_test_case"

class PastEventsTest < ApplicationSystemTestCase
  setup do
    @past_event = past_events(:one)
  end

  test "visiting the index" do
    visit past_events_url
    assert_selector "h1", text: "Past Events"
  end

  test "creating a Past event" do
    visit past_events_url
    click_on "New Past Event"

    click_on "Create Past event"

    assert_text "Past event was successfully created"
    click_on "Back"
  end

  test "updating a Past event" do
    visit past_events_url
    click_on "Edit", match: :first

    click_on "Update Past event"

    assert_text "Past event was successfully updated"
    click_on "Back"
  end

  test "destroying a Past event" do
    visit past_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Past event was successfully destroyed"
  end
end
