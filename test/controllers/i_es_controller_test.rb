require 'test_helper'

class IEsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ie = ies(:one)
  end

  test "should get index" do
    get ies_index_url
    assert_response :success
  end

  test "should get new" do
    get new_ie_url
    assert_response :success
  end

  test "should create ie" do
    assert_difference('Ies.count') do
      post ies_index_url, params: { ie: { city: @ie.city, name: @ie.name } }
    end

    assert_redirected_to ie_url(Ies.last)
  end

  test "should show ie" do
    get ie_url(@ie)
    assert_response :success
  end

  test "should get edit" do
    get edit_ie_url(@ie)
    assert_response :success
  end

  test "should update ie" do
    patch ie_url(@ie), params: { ie: { city: @ie.city, name: @ie.name } }
    assert_redirected_to ie_url(@ie)
  end

  test "should destroy ie" do
    assert_difference('Ies.count', -1) do
      delete ie_url(@ie)
    end

    assert_redirected_to ies_index_url
  end
end
