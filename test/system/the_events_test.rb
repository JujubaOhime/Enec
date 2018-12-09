require "application_system_test_case"

class TheEventsTest < ApplicationSystemTestCase
  setup do
    @the_event = the_events(:one)
  end

  test "visiting the index" do
    visit the_events_url
    assert_selector "h1", text: "The Events"
  end

  test "creating a The event" do
    visit the_events_url
    click_on "New The Event"

    fill_in "Content", with: @the_event.content
    fill_in "Days", with: @the_event.days
    fill_in "Title", with: @the_event.title
    click_on "Create The event"

    assert_text "The event was successfully created"
    click_on "Back"
  end

  test "updating a The event" do
    visit the_events_url
    click_on "Edit", match: :first

    fill_in "Content", with: @the_event.content
    fill_in "Days", with: @the_event.days
    fill_in "Título   ", with: @the_event.title
    click_on "Update The event"

    assert_text "The event was successfully updated"
    click_on "Back"
  end

  test "destroying a The event" do
    visit the_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "The event was successfully destroyed"
  end
end
