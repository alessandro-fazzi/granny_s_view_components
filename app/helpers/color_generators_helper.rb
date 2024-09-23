module ColorGeneratorsHelper
  class RandomColorViewComponent
    attr_accessor :color, :format
    attr_reader :button, :content_id

    def initialize
      @content_id = "awesome_content"
      @format = :html

      @color = "#FFFFFF"
      @content = nil
      @button = nil
    end

    def render_button
      @button ||= GenerateColorButton.new
    end

    def button?
      !button.nil?
    end

    def render_in(h)
      case format
      when :html then render_html(h)
      when :turbo_stream then render_turbo_stream(h)
      end
    end

    private

    def render_html(h)
      r = []
      r << h.tag.div(id: content_id, style: "background: #{color}") do
        "Current background color is #{color}"
      end
      r << h.render(button) if button?

      h.safe_join(r)
    end

    def render_turbo_stream(h)
      h.turbo_stream.replace(content_id) { render_html(h) }
    end
  end

  class GenerateColorButton
    def render_in(h)
      h.button_to "generate", h.color_generators_path
    end
  end
end
