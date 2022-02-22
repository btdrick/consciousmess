require "test_helper"

class RipplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ripple = ripples(:one)
  end

  test "should get index" do
    get ripples_url
    assert_response :success
  end

  test "should get new" do
    get new_ripple_url
    assert_response :success
  end

  test "should create ripple" do
    assert_difference('Ripple.count') do
      post ripples_url, params: { ripple: { author: @ripple.author, message: @ripple.message, website: @ripple.website } }
    end

    assert_redirected_to ripple_url(Ripple.last)
  end

  test "should show ripple" do
    get ripple_url(@ripple)
    assert_response :success
  end

  test "should get edit" do
    get edit_ripple_url(@ripple)
    assert_response :success
  end

  test "should update ripple" do
    patch ripple_url(@ripple), params: { ripple: { author: @ripple.author, message: @ripple.message, website: @ripple.website } }
    assert_redirected_to ripple_url(@ripple)
  end

  test "should destroy ripple" do
    assert_difference('Ripple.count', -1) do
      delete ripple_url(@ripple)
    end

    assert_redirected_to ripples_url
  end
end
