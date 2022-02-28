require "application_system_test_case"

class RipplesTest < ApplicationSystemTestCase
  setup do
    @ripple = ripples(:ripple_1)
  end

  test "visiting the index" do
    visit ripples_url
    assert_selector "h1", text: "CONSCIOUS/mess 🧠"
    assert_selector "h4", text: "...a stream of anonymous online ramblings"
  end

  test "visiting create ripple" do
    visit ripples_url
    click_on "Create Ripple"

    assert_selector "h1", text: "New Ripple"
  end
  test "creating a Ripple with website" do
    visit ripples_url
    click_on "Create Ripple"

    fill_in "ripple_author", with: @ripple.author
    fill_in "ripple_website", with: @ripple.website
    fill_in "ripple_message", with: @ripple.message
    click_on "Create Ripple"

    assert_text "Ripple was successfully created"
  end

  test "creating a Ripple with no website" do
    visit ripples_url
    click_on "Create Ripple"

    fill_in "ripple_author", with: @ripple.author
    fill_in "ripple_message", with: @ripple.message
    click_on "Create Ripple"

    assert_text "Ripple was successfully created"
  end

  test "navigate to next page and back to newest" do
    visit ripples_url

    assert_no_text "Newest"
    assert_text "Next 10 Ripples"
    click_on "Next 10 Ripples"

    assert_text "Next 10 Ripples"
    assert_text "Newest"
    click_on "Newest"
  end

  test "navigate to oldest and back a page" do
    visit ripples_url

    assert_no_text "Previous 10 Ripples"
    assert_text "Oldest"
    click_on "Oldest"

    assert_text "Previous 10 Ripples"
    assert_no_text "Oldest"
    click_on "Previous 10 Ripples"
  end
end
