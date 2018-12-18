require 'test_helper'

classLandingPage::EventNoticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_notice = event_notices(:one)
  end

  test "should get index" do
    get event_notices_url
    assert_response :success
  end

  test "should get new" do
    get new_event_notice_url
    assert_response :success
  end

  test "should create event_notice" do
    assert_difference('EventNotice.count') do
      post event_notices_url, params: { event_notice: { content: @event_notice.content, title: @event_notice.title } }
    end

    assert_redirected_to event_notice_url(EventNotice.last)
  end

  test "should show event_notice" do
    get event_notice_url(@event_notice)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_notice_url(@event_notice)
    assert_response :success
  end

  test "should update event_notice" do
    patch event_notice_url(@event_notice), params: { event_notice: { content: @event_notice.content, title: @event_notice.title } }
    assert_redirected_to event_notice_url(@event_notice)
  end

  test "should destroy event_notice" do
    assert_difference('EventNotice.count', -1) do
      delete event_notice_url(@event_notice)
    end

    assert_redirected_to event_notices_url
  end
end
