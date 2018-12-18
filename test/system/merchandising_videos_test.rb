require "application_system_test_case"

classLandingPage::MerchandisingVideosTest < ApplicationSystemTestCase
  setup do
    @merchandising_video = merchandising_videos(:one)
  end

  test "visiting the index" do
    visit merchandising_videos_url
    assert_selector "h1", text: "Merchandising Videos"
  end

  test "creating a Merchandising video" do
    visit merchandising_videos_url
    click_on "New Merchandising Video"

    fill_in "Title", with: @merchandising_video.title
    fill_in "Video", with: @merchandising_video.video
    click_on "Create Merchandising video"

    assert_text "Merchandising video was successfully created"
    click_on "Back"
  end

  test "updating a Merchandising video" do
    visit merchandising_videos_url
    click_on "Edit", match: :first

    fill_in "Title", with: @merchandising_video.title
    fill_in "Video", with: @merchandising_video.video
    click_on "Update Merchandising video"

    assert_text "Merchandising video was successfully updated"
    click_on "Back"
  end

  test "destroying a Merchandising video" do
    visit merchandising_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Merchandising video was successfully destroyed"
  end
end
