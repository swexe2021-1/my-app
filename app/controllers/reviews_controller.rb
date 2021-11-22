class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @q = Review.ransack(params[:q])
    @reviews = @q.result(district: true)
  end

  def new
    @review = Review.new
  end

  def create
    #ログイン中にしたツイートリンクが表示されないのでsession[:user_id]が空であることは考慮しなくてよい
    user = User.find_by(uid: current_user.uid)
    @review = Review.new(star: params[:review][:star], description: params[:review][:description], user_id: user.id, tdate: Time.current, prefecture: params[:review][:prefecture], city: params[:review][:city], district: params[:review][:district], category: params[:review][:category])
    if @review.save
       flash[:notice] = 'レビューを投稿しました'
      redirect_to reviews_path
    else
      render 'new'
    end
  end
  
  def edit
    @review = Review.find(params[:id])
  end

  def update
    user = User.find_by(uid: current_user.uid)
    @review = Review.find(params[:id])
    if @review.update(star: params[:review][:star], description: params[:review][:description], user_id: user.id, tdate: Time.current, prefecture: params[:review][:prefecture], city: params[:review][:city], district: params[:review][:district], category: params[:review][:category])
      flash[:notice] = 'レビューを更新しました'
      @review.save
      redirect_to reviews_path
    else
      render 'edit'
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
end
