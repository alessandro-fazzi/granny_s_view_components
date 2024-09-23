class ColorGeneratorsController < ApplicationController
  def show
    initial_color = "#FFFFFF"
    respond_to do |format|
      format.html do
        render "show", locals: { color: initial_color }
      end
    end
  end

  def create
    random_color = RandomColor.new

    respond_to do |format|
      format.turbo_stream do
        render "show", locals: { color: random_color }
      end
    end
  end
end
