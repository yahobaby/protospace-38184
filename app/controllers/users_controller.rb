#userコントローラー202210072155
class UsersController < ApplicationController
  def show #個別詳細ページを表示するリクエストに対応
    @user = User.find(params[:id]) #userモデルと紐づいてるデータベースから、idカラムをパラメーターとして読み取り、＠userに代入
    @prototypes = Prototype.all
  end
end

# def comment_params
#   params.require(:user).permit(:name, :profile, :occupation, :position).marge(params[:id])
# end
