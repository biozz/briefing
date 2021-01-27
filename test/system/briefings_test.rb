require "application_system_test_case"

class BriefingsTest < ApplicationSystemTestCase
  setup do
    @briefing = briefings(:one)
  end

  test "visiting the index" do
    visit briefings_url
    assert_selector "h1", text: "Briefings"
  end

  test "creating a Briefing" do
    visit briefings_url
    click_on "New Briefing"

    fill_in "Name", with: @briefing.name
    click_on "Create Briefing"

    assert_text "Briefing was successfully created"
    click_on "Back"
  end

  test "updating a Briefing" do
    visit briefings_url
    click_on "Edit", match: :first

    fill_in "Name", with: @briefing.name
    click_on "Update Briefing"

    assert_text "Briefing was successfully updated"
    click_on "Back"
  end

  test "destroying a Briefing" do
    visit briefings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Briefing was successfully destroyed"
  end
end
