require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @translations = I18n.backend.send(:translations)
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title",
      "#{@translations[:en][:home]} | #{@translations[:en][:title]}"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title",
      "#{@translations[:en][:home]} | #{@translations[:en][:title]}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title",
      "#{@translations[:en][:help]} | #{@translations[:en][:title]}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title",
      "#{@translations[:en][:about]} | #{@translations[:en][:title]}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title",
      "#{@translations[:en][:contact]} | #{@translations[:en][:title]}"
  end
end
