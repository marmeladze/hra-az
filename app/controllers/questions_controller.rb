class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render 'home/faq'
  end  
end