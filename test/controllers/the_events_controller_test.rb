require 'test_helper'

classLandingPage::TheEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @the_event = the_events(:one)
  end

  test "should get index" do
    get the_events_url
    assert_response :success
  end

  test "should get new" do
    get new_the_event_url
    assert_response :success
  end

  test "should create the_event" do
    assert_difference('TheEvent.count') do
      post the_events_url, params: { the_event: { content: @the_event.content, days: @the_event.days, title: @the_event.title } }
    end

    assert_redirected_to the_event_url(TheEvent.last)
  end

  test "should show the_event" do
    get the_event_url(@the_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_the_event_url(@the_event)
    assert_response :success
  end

  test "should update the_event" do
    patch the_event_url(@the_event), params: { the_event: { content: @the_event.content, days: @the_event.days, title: @the_event.title } }
    assert_redirected_to the_event_url(@the_event)
  end

  test "should destroy the_event" do
    assert_difference('TheEvent.count', -1) do
      delete the_event_url(@the_event)
    end

    assert_redirected_to the_events_url
  end
end
