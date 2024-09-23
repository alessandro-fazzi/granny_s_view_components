# frozen_string_literal: true

require "test_helper"

class RandomColorViewComponentTest < ActionView::TestCase
  setup do
    @component = ColorGeneratorsHelper::RandomColorViewComponent.new
  end

  test "renders turbo stream" do
    @component.format = :turbo_stream
    @component.color = RandomColor.new(hex: "ffff00")

    render @component

    assert_select "turbo-stream[action='replace'][target='awesome_content']" do
      assert_select "div#awesome_content[style='background: #ffff00']"
    end
  end

  test "render html" do
    render @component

    assert_select "div#awesome_content[style='background: #FFFFFF']"
  end

  test "render html with button enabled" do
    @component.render_button

    render @component

    assert_select "div#awesome_content[style='background: #FFFFFF']"
    assert_select "form[action='/color_generators']" do
      assert_select "button", "generate"
    end
  end
end
