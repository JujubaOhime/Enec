require 'test_helper'

class LandingPage::EventRealizersTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_realizers_title = event_realizers_titles(:one)
  end

  test "should get index" do
    get event_realizers_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_event_realizers_title_url
    assert_response :success
  end

  test "should create event_realizers_title" do
    assert_difference('LandingPage::EventRealizersTitle.count') do
      post event_realizers_titles_url, params: { event_realizers_title: { title: @event_realizers_title.title } }
    end

    assert_redirected_to event_realizers_title_url(LandingPage::EventRealizersTitle.last)
  end

  test "should show event_realizers_title" do
    get event_realizers_title_url(@event_realizers_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_realizers_title_url(@event_realizers_title)
    assert_response :success
  end

  test "should update event_realizers_title" do
    patch event_realizers_title_url(@event_realizers_title), params: { event_realizers_title: { title: @event_realizers_title.title } }
    assert_redirected_to event_realizers_title_url(@event_realizers_title)
  end

  test "should destroy event_realizers_title" do
    assert_difference('LandingPage::EventRealizersTitle.count', -1) do
      delete event_realizers_title_url(@event_realizers_title)
    end

    assert_redirected_to event_realizers_titles_url
  end
end
