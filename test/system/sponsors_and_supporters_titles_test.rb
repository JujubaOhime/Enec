require "application_system_test_case"

class SponsorsAndSupportersTitlesTest < ApplicationSystemTestCase
  setup do
    @sponsors_and_supporters_title = sponsors_and_supporters_titles(:one)
  end

  test "visiting the index" do
    visit sponsors_and_supporters_titles_url
    assert_selector "h1", text: "Sponsors And Supporters Titles"
  end

  test "creating a Sponsors and supporters title" do
    visit sponsors_and_supporters_titles_url
    click_on "New Sponsors And Supporters Title"

    fill_in "Title", with: @sponsors_and_supporters_title.title
    click_on "Create Sponsors and supporters title"

    assert_text "Sponsors and supporters title was successfully created"
    click_on "Back"
  end

  test "updating a Sponsors and supporters title" do
    visit sponsors_and_supporters_titles_url
    click_on "Edit", match: :first

    fill_in "Title", with: @sponsors_and_supporters_title.title
    click_on "Update Sponsors and supporters title"

    assert_text "Sponsors and supporters title was successfully updated"
    click_on "Back"
  end

  test "destroying a Sponsors and supporters title" do
    visit sponsors_and_supporters_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sponsors and supporters title was successfully destroyed"
  end
end
