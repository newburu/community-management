require "application_system_test_case"

class CommunitiesTest < ApplicationSystemTestCase
  setup do
    @community = communities(:one)
  end

  test "visiting the index" do
    visit communities_url
    assert_selector "h1", text: "Communities"
  end

  test "should create community" do
    visit communities_url
    click_on "New community"

    fill_in "Comment", with: @community.comment
    fill_in "Name", with: @community.name
    fill_in "Url", with: @community.url
    fill_in "User", with: @community.owner_id
    click_on "Create Community"

    assert_text "Community was successfully created"
    click_on "Back"
  end

  test "should update Community" do
    visit community_url(@community)
    click_on "Edit this community", match: :first

    fill_in "Comment", with: @community.comment
    fill_in "Name", with: @community.name
    fill_in "Url", with: @community.url
    fill_in "User", with: @community.owner_id
    click_on "Update Community"

    assert_text "Community was successfully updated"
    click_on "Back"
  end

  test "should destroy Community" do
    visit community_url(@community)
    click_on "Destroy this community", match: :first

    assert_text "Community was successfully destroyed"
  end
end
