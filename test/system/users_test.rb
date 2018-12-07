require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Ies city", with: @user.IES_city
    fill_in "Ies course", with: @user.IES_course
    fill_in "Ies name", with: @user.IES_name
    fill_in "Ies period", with: @user.IES_period
    fill_in "Ies registration proof", with: @user.IES_registration_proof
    fill_in "Ies state", with: @user.IES_state
    fill_in "Address", with: @user.address
    fill_in "Birth date", with: @user.birth_date
    fill_in "City", with: @user.city
    fill_in "Cpf", with: @user.cpf
    fill_in "Delegation", with: @user.delegation
    fill_in "Email", with: @user.email
    fill_in "Gender", with: @user.gender
    fill_in "Lot", with: @user.lot_id
    fill_in "Name", with: @user.name
    fill_in "Rg", with: @user.rg
    fill_in "Rg issuing body", with: @user.rg_issuing_body
    fill_in "State", with: @user.state
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Ies city", with: @user.IES_city
    fill_in "Ies course", with: @user.IES_course
    fill_in "Ies name", with: @user.IES_name
    fill_in "Ies period", with: @user.IES_period
    fill_in "Ies registration proof", with: @user.IES_registration_proof
    fill_in "Ies state", with: @user.IES_state
    fill_in "Address", with: @user.address
    fill_in "Birth date", with: @user.birth_date
    fill_in "City", with: @user.city
    fill_in "Cpf", with: @user.cpf
    fill_in "Delegation", with: @user.delegation
    fill_in "Email", with: @user.email
    fill_in "Gender", with: @user.gender
    fill_in "Lot", with: @user.lot_id
    fill_in "Name", with: @user.name
    fill_in "Rg", with: @user.rg
    fill_in "Rg issuing body", with: @user.rg_issuing_body
    fill_in "State", with: @user.state
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
