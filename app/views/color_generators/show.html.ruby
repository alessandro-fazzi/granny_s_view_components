local_assigns => {color: String }

view = ColorGeneratorsHelper::RandomColorViewComponent.new.tap do |v|
  v.render_button
end

render view
