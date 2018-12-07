require 'test_helper'

class SponsorsAndSupportersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sponsors_and_supporter = sponsors_and_supporters(:one)
  end

  test "should get index" do
    get sponsors_and_supporters_url
    assert_response :success
  end

  test "should get new" do
    get new_sponsors_and_supporter_url
    assert_response :success
  end

  test "should create sponsors_and_supporter" do
    assert_difference('SponsorsAndSupporter.count') do
      post sponsors_and_supporters_url, params: { sponsors_and_supporter: { image: @sponsors_and_supporter.image, link: @sponsors_and_supporter.link } }
    end

    assert_redirected_to sponsors_and_supporter_url(SponsorsAndSupporter.last)
  end

  test "should show sponsors_and_supporter" do
    get sponsors_and_supporter_url(@sponsors_and_supporter)
    assert_response :success
  end

  test "should get edit" do
    get edit_sponsors_and_supporter_url(@sponsors_and_supporter)
    assert_response :success
  end

  test "should update sponsors_and_supporter" do
    patch sponsors_and_supporter_url(@sponsors_and_supporter), params: { sponsors_and_supporter: { image: @sponsors_and_supporter.image, link: @sponsors_and_supporter.link } }
    assert_redirected_to sponsors_and_supporter_url(@sponsors_and_supporter)
  end

  test "should destroy sponsors_and_supporter" do
    assert_difference('SponsorsAndSupporter.count', -1) do
      delete sponsors_and_supporter_url(@sponsors_and_supporter)
    end

    assert_redirected_to sponsors_and_supporters_url
  end
end
