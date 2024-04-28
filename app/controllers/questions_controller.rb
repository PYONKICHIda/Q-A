class QuestionsController < ApplicationController
  #質問一覧表示
  def index
    @questions = Question.all
    # p @questions
  end
  #質問詳細
  def show
    # p params[:id]
    @question = Question.find(params[:id])
    # p @question
  end
  #質問作成
  def new
    @question = Question.new
  end
  #登録
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new',status: :unprocessable_entity
    end
  end
  #編集
  def edit
    @question = Question.find(params[:id])
  end
  #更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit' , status: :unprocessable_entity
    end
  end
  #削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to question_path
  end
  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
