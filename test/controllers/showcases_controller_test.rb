require 'test_helper'

classLandingPage::ShowcasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showcase = showcases(:one)
  end

  test "should get index" do
    get showcases_url
    assert_response :success
  end

  test "should get new" do
    get new_showcase_url
    assert_response :success
  end

  test "should create showcase" do
    assert_difference('Showcase.count') do
      post showcases_url, params: { showcase: { phrase: @showcase.phrase, subtitle: @showcase.subtitle, title: @showcase.title } }
    end

    assert_redirected_to showcase_url(Showcase.last)
  end

  test "should show showcase" do
    get showcase_url(@showcase)
    assert_response :success
  end

  test "should get edit" do
    get edit_showcase_url(@showcase)
    assert_response :success
  end

  test "should update showcase" do
    patch showcase_url(@showcase), params: { showcase: { phrase: @showcase.phrase, subtitle: @showcase.subtitle, title: @showcase.title } }
    assert_redirected_to showcase_url(@showcase)
  end

  test "should destroy showcase" do
    assert_difference('Showcase.count', -1) do
      delete showcase_url(@showcase)
    end

    assert_redirected_to showcases_url
  end
end
