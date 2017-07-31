module Admin
  class QuestionsController < ApplicationController
    before_action :logged_in_user
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    layout "admin"

    def index
      @questions = Question.all.order(updated_at: :desc).page params[:page]
    end

    def new
      @question = Question.new
    end

    def edit
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to admin_questions_path, notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to admin_questions_path, notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_questions_url, notice: 'Question was successfully destroyed.'
    end

    private
      def set_question
        @question = Question.find(params[:id])
      end

      def question_params
        params.require(:question).permit(:title, :answer)
      end
  end
end
