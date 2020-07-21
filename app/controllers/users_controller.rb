class UsersController < ApplicationController
  #ユーザー一覧を表示する必要が無い気がするので一応コメントアウト
  #def index
   # @users = User.order(id: :desc).page(params[:page]).per(25)
  #end

  #ユーザーの詳細も表示しなくていい気がするのでとりあえずこれもコメントアウト
  #def show
  #end

#これは要る。
  def new
    @user = User.new
  end

#これ成功したときにどこのページへredirect_toするのか不明
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
