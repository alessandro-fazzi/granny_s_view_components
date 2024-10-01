view = View::ColorColumns.new.tap do |v|
  v.render_column_1.tap do |c1|
    c1.render_color_1
    c1.render_color_2
  end

  v.render_column_2.tap do |c2|
    c2.render_color_1
    c2.render_color_2
  end

  v.render_column_3.tap do |c3|
    c3.render_color_1
    c3.render_color_2
  end
end

render view
