class RandomColorPreview < Lookbook::Preview
  def default
    component = ColorGeneratorsHelper::RandomColorViewComponent.new

    render component
    # render template: "color_generators/show"
  end

  # @param color [String] "Hex CSS color"
  # @param render_button [Boolean]
  def with_args(color: "#ff0000", render_button: true)
    component = ColorGeneratorsHelper::RandomColorViewComponent.new.tap do |v|
      v.color = color
      v.render_button if render_button
    end

    render component
  end

  def stream
    component = ColorGeneratorsHelper::RandomColorViewComponent.new.tap do |v|
      v.color = "#ff0000"
      v.format = :turbo_stream
    end

    render component
  end
end
