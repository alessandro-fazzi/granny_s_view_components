local_assigns => {color: RandomColor, color_ids: }

# view = View::ColorColumns.new.tap do |v|
#   v.render_column_1.tap do |c1|
#     c1.render_color_1(condition: -> { color_id == color_1_id })&.tap { _1.color = color }
#   end

#   v.render_column_2.tap do |c2|
#     c2.render_color_2(condition: -> { color_id == color_2_id })&.tap { _1.color = color }
#   end

#   v.render_column_3.tap do |c3|
#     c3.render_color_1(condition: -> { color_id == color_1_id })&.tap { _1.color = color }
#   end
# end

# render view

safe_join(color_ids.map do |id|
  component = View::Components::Color.new(id:)
  component.color = color
  render component
end)
