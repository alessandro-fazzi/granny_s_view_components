local_assigns => {color: RandomColor }

view = ColorGeneratorsHelper::RandomColorViewComponent.new.tap do |v|
  v.format = :turbo_stream
  v.color = color
end

render view
