class ApplicationPagesController < ApplicationController
  def home
    @questions = Question.all
    @tags = Tag.all
  end
end
