require "application_system_test_case"

classLandingPage::EventNoticesTest < ApplicationSystemTestCase
  setup do
    @event_notice = event_notices(:one)
  end

  test "visiting the index" do
    visit event_notices_url
    assert_selector "h1", text: "Event Notices"
  end

  test "creating a Event notice" do
    visit event_notices_url
    click_on "New Event Notice"

    fill_in "Content", with: @event_notice.content
    fill_in "Title", with: @event_notice.title
    click_on "Create Event notice"

    assert_text "Event notice was successfully created"
    click_on "Back"
  end

  test "updating a Event notice" do
    visit event_notices_url
    click_on "Edit", match: :first

    fill_in "Content", with: @event_notice.content
    fill_in "Title", with: @event_notice.title
    click_on "Update Event notice"

    assert_text "Event notice was successfully updated"
    click_on "Back"
  end

  test "destroying a Event notice" do
    visit event_notices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event notice was successfully destroyed"
  end
end
