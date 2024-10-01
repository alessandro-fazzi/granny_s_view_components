class ColorGeneratorsController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        render "show"
      end
    end
  end

  def create
    random_color = RandomColor.new

    respond_to do |format|
      format.turbo_stream do
        render "show", locals: { color: random_color, color_ids: params.require(:color_ids) }
      end
    end
  end
end
