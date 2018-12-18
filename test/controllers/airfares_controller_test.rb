require 'test_helper'

classLandingPage::AirfaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @airfare = airfares(:one)
  end

  test "should get index" do
    get airfares_url
    assert_response :success
  end

  test "should get new" do
    get new_airfare_url
    assert_response :success
  end

  test "should create airfare" do
    assert_difference('Airfare.count') do
      post airfares_url, params: { airfare: { phrase: @airfare.phrase, title: @airfare.title } }
    end

    assert_redirected_to airfare_url(Airfare.last)
  end

  test "should show airfare" do
    get airfare_url(@airfare)
    assert_response :success
  end

  test "should get edit" do
    get edit_airfare_url(@airfare)
    assert_response :success
  end

  test "should update airfare" do
    patch airfare_url(@airfare), params: { airfare: { phrase: @airfare.phrase, title: @airfare.title } }
    assert_redirected_to airfare_url(@airfare)
  end

  test "should destroy airfare" do
    assert_difference('Airfare.count', -1) do
      delete airfare_url(@airfare)
    end

    assert_redirected_to airfares_url
  end
end
