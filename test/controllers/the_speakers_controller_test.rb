require 'test_helper'

class TheSpeakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @the_speaker = the_speakers(:one)
  end

  test "should get index" do
    get the_speakers_url
    assert_response :success
  end

  test "should get new" do
    get new_the_speaker_url
    assert_response :success
  end

  test "should create the_speaker" do
    assert_difference('TheSpeaker.count') do
      post the_speakers_url, params: { the_speaker: { description: @the_speaker.description, title: @the_speaker.title } }
    end

    assert_redirected_to the_speaker_url(TheSpeaker.last)
  end

  test "should show the_speaker" do
    get the_speaker_url(@the_speaker)
    assert_response :success
  end

  test "should get edit" do
    get edit_the_speaker_url(@the_speaker)
    assert_response :success
  end

  test "should update the_speaker" do
    patch the_speaker_url(@the_speaker), params: { the_speaker: { description: @the_speaker.description, title: @the_speaker.title } }
    assert_redirected_to the_speaker_url(@the_speaker)
  end

  test "should destroy the_speaker" do
    assert_difference('TheSpeaker.count', -1) do
      delete the_speaker_url(@the_speaker)
    end

    assert_redirected_to the_speakers_url
  end
end
