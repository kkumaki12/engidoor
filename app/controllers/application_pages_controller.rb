class ApplicationPagesController < ApplicationController
  def home
    @questions = Question.all
  end
end
