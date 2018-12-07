require "application_system_test_case"

class ShowcasesTest < ApplicationSystemTestCase
  setup do
    @showcase = showcases(:one)
  end

  test "visiting the index" do
    visit showcases_url
    assert_selector "h1", text: "Showcases"
  end

  test "creating a Showcase" do
    visit showcases_url
    click_on "New Showcase"

    fill_in "Phrase", with: @showcase.phrase
    fill_in "Subtitle", with: @showcase.subtitle
    fill_in "Title", with: @showcase.title
    click_on "Create Showcase"

    assert_text "Showcase was successfully created"
    click_on "Back"
  end

  test "updating a Showcase" do
    visit showcases_url
    click_on "Edit", match: :first

    fill_in "Phrase", with: @showcase.phrase
    fill_in "Subtitle", with: @showcase.subtitle
    fill_in "Title", with: @showcase.title
    click_on "Update Showcase"

    assert_text "Showcase was successfully updated"
    click_on "Back"
  end

  test "destroying a Showcase" do
    visit showcases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Showcase was successfully destroyed"
  end
end
