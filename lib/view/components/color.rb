module View
  module Components
    class Color
      attr_accessor :color
      attr_reader :button, :id

      def initialize(id:)
        @id = id
        @color = RandomColor.new(hex: "FFFFFF")
        @content = nil
        @button = GenerateColorButton.new(color_ids: [ id ])
      end

      def class
        "color-#{color.hex}"
      end

      def render_in(h)
        h.controller.respond_to do |format|
          format.html { render_html(h) }
          format.turbo_stream { render_turbo_stream(h) }
        end
      end

      private

      def render_html(h)
        h.tag.div(style: "border: 1px solid gray;") do
          r = []
          r << render_color(h)
          r << h.render(button)

          h.safe_join(r)
        end
      end

      def render_color(h)
        h.tag.div(id:, class:, style: "background: #{color}; padding: 0.5em;") do
          "Current background color is #{color}"
        end
      end

      def render_turbo_stream(h)
        h.turbo_stream.replace(id) { render_color(h) }
      end
    end
  end
end
