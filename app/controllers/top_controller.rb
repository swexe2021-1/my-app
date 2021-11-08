class TopController < ApplicationController
    def main
        render 'login'
    end
    
    def login
        user = User.find_by(uid: params[:uid])
        if user and BCrypt::Password.new(user.pass) == params[:pass]
           flash[:notice] = 'ログインしました'
           session[:login_uid] = params[:uid]
           redirect_to root_path
        else
            flash[:notice] = 'ログインエラー'
            render 'login_failed'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
