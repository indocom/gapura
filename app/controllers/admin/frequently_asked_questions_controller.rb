class Admin::FrequentlyAskedQuestionsController < ApplicationController
  before_action :set_faq, only: [:edit, :update, :destroy]

  def index
    @faqs = FrequentlyAskedQuestion.all
  end

  def new
    @faq = FrequentlyAskedQuestion.new
  end

  def edit
  end

  def create
    @faq = FrequentlyAskedQuestion.new(faq_params)

    if @faq.save
      redirect_to admin_frequently_asked_question_url(@faq), notice: 'Frequently asked question was successfully created.'
    else
      render :new
    end
  end

  def update
    if @faq.update(faq_params)
      redirect_to admin_frequently_asked_question_url(@faq), notice: 'Frequently asked question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @faq.destroy
    redirect_to admin_frequently_asked_questions_url, notice: 'Frequently asked question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = FrequentlyAskedQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faq_params
      params.require(:frequently_asked_question).permit(:question, :answer)
    end
end
