require "application_system_test_case"

classLandingPage::AirfaresTest < ApplicationSystemTestCase
  setup do
    @airfare = airfares(:one)
  end

  test "visiting the index" do
    visit airfares_url
    assert_selector "h1", text: "Airfares"
  end

  test "creating aLandingPage::Airfare" do
    visit airfares_url
    click_on "NewLandingPage::Airfare"

    fill_in "Phrase", with: @airfare.phrase
    fill_in "Title", with: @airfare.title
    click_on "CreateLandingPage::Airfare"

    assert_text "Airfare was successfully created"
    click_on "Back"
  end

  test "updating aLandingPage::Airfare" do
    visit airfares_url
    click_on "Edit", match: :first

    fill_in "Phrase", with: @airfare.phrase
    fill_in "Title", with: @airfare.title
    click_on "UpdateLandingPage::Airfare"

    assert_text "Airfare was successfully updated"
    click_on "Back"
  end

  test "destroying aLandingPage::Airfare" do
    visit airfares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Airfare was successfully destroyed"
  end
end
