require 'test_helper'

class MerchandisingVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchandising_video = merchandising_videos(:one)
  end

  test "should get index" do
    get merchandising_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_merchandising_video_url
    assert_response :success
  end

  test "should create merchandising_video" do
    assert_difference('MerchandisingVideo.count') do
      post merchandising_videos_url, params: { merchandising_video: { title: @merchandising_video.title, video: @merchandising_video.video } }
    end

    assert_redirected_to merchandising_video_url(MerchandisingVideo.last)
  end

  test "should show merchandising_video" do
    get merchandising_video_url(@merchandising_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_merchandising_video_url(@merchandising_video)
    assert_response :success
  end

  test "should update merchandising_video" do
    patch merchandising_video_url(@merchandising_video), params: { merchandising_video: { title: @merchandising_video.title, video: @merchandising_video.video } }
    assert_redirected_to merchandising_video_url(@merchandising_video)
  end

  test "should destroy merchandising_video" do
    assert_difference('MerchandisingVideo.count', -1) do
      delete merchandising_video_url(@merchandising_video)
    end

    assert_redirected_to merchandising_videos_url
  end
end
