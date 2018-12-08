require "application_system_test_case"

class IesTest < ApplicationSystemTestCase
  setup do
    @ie = ies(:one)
  end

  test "visiting the index" do
    visit ies_url
    assert_selector "h1", text: "Ies"
  end

  test "creating a Ies" do
    visit ies_url
    click_on "New Ies"

    fill_in "City", with: @ie.city
    fill_in "Name", with: @ie.name
    click_on "Create Ies"

    assert_text "Ies was successfully created"
    click_on "Back"
  end

  test "updating a Ies" do
    visit ies_url
    click_on "Edit", match: :first

    fill_in "City", with: @ie.city
    fill_in "Name", with: @ie.name
    click_on "Update Ies"

    assert_text "Ies was successfully updated"
    click_on "Back"
  end

  test "destroying a Ies" do
    visit ies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ies was successfully destroyed"
  end
end
