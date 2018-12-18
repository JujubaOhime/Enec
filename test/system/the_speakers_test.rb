require "application_system_test_case"

classLandingPage::TheSpeakersTest < ApplicationSystemTestCase
  setup do
    @the_speaker = the_speakers(:one)
  end

  test "visiting the index" do
    visit the_speakers_url
    assert_selector "h1", text: "The Speakers"
  end

  test "creating a The speaker" do
    visit the_speakers_url
    click_on "New The Speaker"

    fill_in "Description", with: @the_speaker.description
    fill_in "Title", with: @the_speaker.title
    click_on "Create The speaker"

    assert_text "The speaker was successfully created"
    click_on "Back"
  end

  test "updating a The speaker" do
    visit the_speakers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @the_speaker.description
    fill_in "Title", with: @the_speaker.title
    click_on "Update The speaker"

    assert_text "The speaker was successfully updated"
    click_on "Back"
  end

  test "destroying a The speaker" do
    visit the_speakers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "The speaker was successfully destroyed"
  end
end
