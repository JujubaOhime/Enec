require "application_system_test_case"

class LandingPage::EventRealizersTest < ApplicationSystemTestCase
  setup do
    @event_realizer = event_realizers(:one)
  end

  test "visiting the index" do
    visit event_realizers_url
    assert_selector "h1", text: "Event Realizers"
  end

  test "creating a Event realizer" do
    visit event_realizers_url
    click_on "New Event Realizer"

    fill_in "Description", with: @event_realizer.description
    fill_in "Image", with: @event_realizer.image
    fill_in "Link", with: @event_realizer.link
    fill_in "Name", with: @event_realizer.name
    click_on "Create Event realizer"

    assert_text "Event realizer was successfully created"
    click_on "Back"
  end

  test "updating a Event realizer" do
    visit event_realizers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @event_realizer.description
    fill_in "Image", with: @event_realizer.image
    fill_in "Link", with: @event_realizer.link
    fill_in "Name", with: @event_realizer.name
    click_on "Update Event realizer"

    assert_text "Event realizer was successfully updated"
    click_on "Back"
  end

  test "destroying a Event realizer" do
    visit event_realizers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event realizer was successfully destroyed"
  end
end
