require 'test_helper'

classLandingPage::SponsorsAndSupportersTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sponsors_and_supporters_title = sponsors_and_supporters_titles(:one)
  end

  test "should get index" do
    get sponsors_and_supporters_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_sponsors_and_supporters_title_url
    assert_response :success
  end

  test "should create sponsors_and_supporters_title" do
    assert_difference('SponsorsAndSupportersTitle.count') do
      post sponsors_and_supporters_titles_url, params: { sponsors_and_supporters_title: { title: @sponsors_and_supporters_title.title } }
    end

    assert_redirected_to sponsors_and_supporters_title_url(SponsorsAndSupportersTitle.last)
  end

  test "should show sponsors_and_supporters_title" do
    get sponsors_and_supporters_title_url(@sponsors_and_supporters_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_sponsors_and_supporters_title_url(@sponsors_and_supporters_title)
    assert_response :success
  end

  test "should update sponsors_and_supporters_title" do
    patch sponsors_and_supporters_title_url(@sponsors_and_supporters_title), params: { sponsors_and_supporters_title: { title: @sponsors_and_supporters_title.title } }
    assert_redirected_to sponsors_and_supporters_title_url(@sponsors_and_supporters_title)
  end

  test "should destroy sponsors_and_supporters_title" do
    assert_difference('SponsorsAndSupportersTitle.count', -1) do
      delete sponsors_and_supporters_title_url(@sponsors_and_supporters_title)
    end

    assert_redirected_to sponsors_and_supporters_titles_url
  end
end
