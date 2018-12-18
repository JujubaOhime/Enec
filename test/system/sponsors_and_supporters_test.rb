require "application_system_test_case"

classLandingPage::SponsorsAndSupportersTest < ApplicationSystemTestCase
  setup do
    @sponsors_and_supporter = sponsors_and_supporters(:one)
  end

  test "visiting the index" do
    visit sponsors_and_supporters_url
    assert_selector "h1", text: "Sponsors And Supporters"
  end

  test "creating a Sponsors and supporter" do
    visit sponsors_and_supporters_url
    click_on "New Sponsors And Supporter"

    fill_in "Image", with: @sponsors_and_supporter.image
    fill_in "Link", with: @sponsors_and_supporter.link
    click_on "Create Sponsors and supporter"

    assert_text "Sponsors and supporter was successfully created"
    click_on "Back"
  end

  test "updating a Sponsors and supporter" do
    visit sponsors_and_supporters_url
    click_on "Edit", match: :first

    fill_in "Image", with: @sponsors_and_supporter.image
    fill_in "Link", with: @sponsors_and_supporter.link
    click_on "Update Sponsors and supporter"

    assert_text "Sponsors and supporter was successfully updated"
    click_on "Back"
  end

  test "destroying a Sponsors and supporter" do
    visit sponsors_and_supporters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sponsors and supporter was successfully destroyed"
  end
end
