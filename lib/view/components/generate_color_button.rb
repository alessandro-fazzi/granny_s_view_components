# frozen_string_literal: true

module View
  module Components
    class GenerateColorButton
      attr_reader :color_ids, :label

      def initialize(color_ids:, label: "Generate")
        @color_ids = Array.wrap(color_ids)
        @label = label
      end

      def render_in(h)
        h.button_to label, h.color_generators_path(color_ids:), style: "margin-bottom: 0.5em"
      end
    end
  end
end
