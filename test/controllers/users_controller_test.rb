require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { IES_city: @user.IES_city, IES_course: @user.IES_course, IES_name: @user.IES_name, IES_period: @user.IES_period, IES_registration_proof: @user.IES_registration_proof, IES_state: @user.IES_state, address: @user.address, birth_date: @user.birth_date, city: @user.city, cpf: @user.cpf, delegation: @user.delegation, email: @user.email, gender: @user.gender, lot_id: @user.lot_id, name: @user.name, rg: @user.rg, rg_issuing_body: @user.rg_issuing_body, state: @user.state } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { IES_city: @user.IES_city, IES_course: @user.IES_course, IES_name: @user.IES_name, IES_period: @user.IES_period, IES_registration_proof: @user.IES_registration_proof, IES_state: @user.IES_state, address: @user.address, birth_date: @user.birth_date, city: @user.city, cpf: @user.cpf, delegation: @user.delegation, email: @user.email, gender: @user.gender, lot_id: @user.lot_id, name: @user.name, rg: @user.rg, rg_issuing_body: @user.rg_issuing_body, state: @user.state } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
