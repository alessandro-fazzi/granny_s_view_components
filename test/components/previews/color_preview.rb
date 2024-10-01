class ColorPreview < Lookbook::Preview
  def default
    component = View::Components::Color.new(id: "foo")

    render component
    # render template: "color_generators/show"
  end

  # @param color [String] "Hex CSS color"
  def with_args(color: "#ff0000")
    component = View::Components::Color.new(id: "foo").tap do |v|
      v.color = color
    end

    render component
  end
end
