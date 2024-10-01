# frozen_string_literal: true

module View
  class ColorColumns
    attr_reader :id, :column_1, :column_2, :column_3

    def initialize
      @id = "columns"
      @column_1 = nil
      @column_2 = nil
      @column_3 = nil
    end

    def render_column_1
      @column_1 ||= Components::ColorColumn.new(id: "#{id}-column-1")
    end

    def render_column_2
      @column_2 ||= Components::ColorColumn.new(id: "#{id}-column-2")
    end

    def render_column_3
      @column_3 ||= Components::ColorColumn.new(id: "#{id}-column-3")
    end

    def columns
      [ @column_1, @column_2, @column_3 ]
    end

    def render_in(h)
      h.controller.respond_to do |format|
        format.html { render_html(h) }
        format.turbo_stream { render_turbo_stream(h) }
      end
    end

    private

    def render_html(h)
      h.tag.div(id:) do
        r = []
        r << h.tag.h1("These are our color columns!")
        r << h.render(column_1) if column_1
        r << h.render(column_2) if column_2
        r << h.render(column_3) if column_3

        h.safe_join(r)
      end
    end

    def render_turbo_stream(h)
      r = []
      r << h.render(column_1) if column_1
      r << h.render(column_2) if column_2
      r << h.render(column_3) if column_3

      h.safe_join(r)
    end
  end
end
