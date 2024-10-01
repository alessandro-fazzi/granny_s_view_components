# frozen_string_literal: true

module View
  module Components
    class ColorColumn
      attr_reader :color_1, :color_2, :class, :id, :button

      def initialize(id:)
        @id = id
        @class = "color-column"
        @button = GenerateColorButton.new(color_ids: [ color_1_id, color_2_id ], label: "Generate All")
        @color_1 = nil
        @color_2 = nil
      end

      def render_color_1(condition: ->() { true })
        return unless instance_exec(&condition)

        @color_1 ||= View::Components::Color.new(id: color_1_id)
      end

      def  color_1_id
        "#{id}-color-1"
      end

      def render_color_2(condition: ->() { true })
        return unless instance_exec(&condition)

        @color_2 ||= View::Components::Color.new(id: color_2_id)
      end

      def  color_2_id
        "#{id}-color-2"
      end

      def render_in(h)
        h.controller.respond_to do |format|
          format.html { render_html(h) }
          format.turbo_stream { render_turbo_stream(h) }
        end
      end

      private

      def render_html(h)
        h.tag.div(
          id:,
          class:,
          style: "border: 1px solid;
                  padding: 1em;
                  width: 400px;
                  display: inline-block;
                  vertical-align: top"
        ) do
          r = []
          r << h.tag.h3("Color column")
          r << h.render(button)
          r << h.render(color_1) if color_1
          r << h.render(color_2) if color_2

          h.safe_join(r)
        end
      end

      def render_turbo_stream(h)
        r =  []
        r << h.render(color_1) if color_1
        r << h.render(color_2) if color_2

        h.safe_join(r)
      end
    end
  end
end
