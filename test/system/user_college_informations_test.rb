require "application_system_test_case"

class UserCollegeInformationsTest < ApplicationSystemTestCase
  setup do
    @user_college_information = user_college_informations(:one)
  end

  test "visiting the index" do
    visit user_college_informations_url
    assert_selector "h1", text: "User College Informations"
  end

  test "creating a User college information" do
    visit user_college_informations_url
    click_on "New User College Information"

    fill_in "Ies", with: @user_college_information.IES_id
    fill_in "Course", with: @user_college_information.course
    fill_in "Period", with: @user_college_information.period
    fill_in "Registration proof", with: @user_college_information.registration_proof
    fill_in "User", with: @user_college_information.user_id
    click_on "Create User college information"

    assert_text "User college information was successfully created"
    click_on "Back"
  end

  test "updating a User college information" do
    visit user_college_informations_url
    click_on "Edit", match: :first

    fill_in "Ies", with: @user_college_information.IES_id
    fill_in "Course", with: @user_college_information.course
    fill_in "Period", with: @user_college_information.period
    fill_in "Registration proof", with: @user_college_information.registration_proof
    fill_in "User", with: @user_college_information.user_id
    click_on "Update User college information"

    assert_text "User college information was successfully updated"
    click_on "Back"
  end

  test "destroying a User college information" do
    visit user_college_informations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User college information was successfully destroyed"
  end
end
