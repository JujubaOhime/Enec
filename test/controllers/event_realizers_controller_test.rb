require 'test_helper'

class LandingPage::EventRealizersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_realizer = event_realizers(:one)
  end

  test "should get index" do
    get event_realizers_url
    assert_response :success
  end

  test "should get new" do
    get new_event_realizer_url
    assert_response :success
  end

  test "should create event_realizer" do
    assert_difference('LandingPage::EventRealizer.count') do
      post event_realizers_url, params: { event_realizer: { description: @event_realizer.description, image: @event_realizer.image, link: @event_realizer.link, name: @event_realizer.name } }
    end

    assert_redirected_to event_realizer_url(LandingPage::EventRealizer.last)
  end

  test "should show event_realizer" do
    get event_realizer_url(@event_realizer)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_realizer_url(@event_realizer)
    assert_response :success
  end

  test "should update event_realizer" do
    patch event_realizer_url(@event_realizer), params: { event_realizer: { description: @event_realizer.description, image: @event_realizer.image, link: @event_realizer.link, name: @event_realizer.name } }
    assert_redirected_to event_realizer_url(@event_realizer)
  end

  test "should destroy event_realizer" do
    assert_difference('LandingPage::EventRealizer.count', -1) do
      delete event_realizer_url(@event_realizer)
    end

    assert_redirected_to event_realizers_url
  end
end
