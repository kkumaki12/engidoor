class ApplicationPagesController < ApplicationController
  def home
    @questions = Question.page(params[:page]).per(7)
    @tags = Tag.all
  end
end
