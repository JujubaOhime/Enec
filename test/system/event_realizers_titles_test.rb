require "application_system_test_case"

class LandingPage::EventRealizersTitlesTest < ApplicationSystemTestCase
  setup do
    @event_realizers_title = event_realizers_titles(:one)
  end

  test "visiting the index" do
    visit event_realizers_titles_url
    assert_selector "h1", text: "Event Realizers Titles"
  end

  test "creating a Event realizers title" do
    visit event_realizers_titles_url
    click_on "New Event Realizers Title"

    fill_in "Title", with: @event_realizers_title.title
    click_on "Create Event realizers title"

    assert_text "Event realizers title was successfully created"
    click_on "Back"
  end

  test "updating a Event realizers title" do
    visit event_realizers_titles_url
    click_on "Edit", match: :first

    fill_in "Title", with: @event_realizers_title.title
    click_on "Update Event realizers title"

    assert_text "Event realizers title was successfully updated"
    click_on "Back"
  end

  test "destroying a Event realizers title" do
    visit event_realizers_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event realizers title was successfully destroyed"
  end
end
