require 'test_helper'

class UserCollegeInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_college_information = user_college_informations(:one)
  end

  test "should get index" do
    get user_college_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_user_college_information_url
    assert_response :success
  end

  test "should create user_college_information" do
    assert_difference('UserCollegeInformation.count') do
      post user_college_informations_url, params: { user_college_information: { IES_id: @user_college_information.IES_id, course: @user_college_information.course, period: @user_college_information.period, registration_proof: @user_college_information.registration_proof, user_id: @user_college_information.user_id } }
    end

    assert_redirected_to user_college_information_url(UserCollegeInformation.last)
  end

  test "should show user_college_information" do
    get user_college_information_url(@user_college_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_college_information_url(@user_college_information)
    assert_response :success
  end

  test "should update user_college_information" do
    patch user_college_information_url(@user_college_information), params: { user_college_information: { IES_id: @user_college_information.IES_id, course: @user_college_information.course, period: @user_college_information.period, registration_proof: @user_college_information.registration_proof, user_id: @user_college_information.user_id } }
    assert_redirected_to user_college_information_url(@user_college_information)
  end

  test "should destroy user_college_information" do
    assert_difference('UserCollegeInformation.count', -1) do
      delete user_college_information_url(@user_college_information)
    end

    assert_redirected_to user_college_informations_url
  end
end
