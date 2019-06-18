require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  def setup
    @translations = I18n.backend.send(:translations)
  end
  test "full title helper" do
    assert_equal full_title, (@translations[:en][:title]).to_s
    assert_equal full_title((@translations[:en][:help]).to_s),
      "#{@translations[:en][:help]} | #{@translations[:en][:title]}"
  end
end
