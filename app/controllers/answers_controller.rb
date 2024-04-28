class AnswersController < ApplicationController
  #登録
  def create
    # p params
    @question = Question.find(params[:question_id])
    @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  #削除
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to @question, status: :see_other
  end

  private
  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end
