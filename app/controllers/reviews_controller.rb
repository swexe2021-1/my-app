class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    #ログイン中にしたツイートリンクが表示されないのでsession[:user_id]が空であることは考慮しなくてよい
    user = User.find_by(uid: current_user.uid)
    @review = Review.new(star: params[:review][:star], description: params[:review][:description], user_id: user.id, tdate: Time.current, prefecture: params[:review][:prefecture], city: params[:review][:city], district: params[:review][:district], building: params[:review][:building], number: params[:review][:number])
    if @review.save
       flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to root_path
  end
end
