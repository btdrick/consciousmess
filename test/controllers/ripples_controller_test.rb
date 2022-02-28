require "test_helper"

class RipplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ripple = ripples(:ripple_1)
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
      post ripples_url, params: { ripple: { author: @ripple.author,
        message: @ripple.message, website: @ripple.website } }
    end

    assert_redirected_to ripples_url
  end

  test "should show ripple" do
    get ripple_url(@ripple)
    assert_response :success
  end

  test "should navigate forward a page and then back to newest ripples" do
    get ripples_url
    assert_equal 0, session[:page]

    assert_difference('session[:page]') do
      get ripples_url(page: 1)
    end
    assert_difference('session[:page]', -1) do
      get ripples_url(page: 0)
    end
  end

  test "should navigate to newest and then backward a page" do
    get ripples_url
    ripple_count = Ripple.count
    last_page = ripple_count
    if last_page % 10 == 0
      last_page -= 1
    end

    assert_difference('session[:page]', last_page) do
      get ripples_url(page: last_page)
    end

    previous_10 = (last_page - 1)
    assert_difference('session[:page]', -1) do
      get ripples_url(page: previous_10)
    end
  end
end
