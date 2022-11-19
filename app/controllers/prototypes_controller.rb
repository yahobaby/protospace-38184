class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create] #要確認？ 順番要注意、set_prototype①,authenticate②,contributor③じゃないと、エラー出る。
  before_action :authenticate_user!, except: [:index, :show] #先に実行させる。ログインしてないと、index(一覧表示)、show(詳細ページ表示)アクションしか使えない
  before_action :contributor_confirmation, only: [:edit, :update, :destroy] #先に実行させる。最下段の#個別詳細ページを表示するリクエストに対応メソッドが実行される。

  def index #一覧表示ページを表示するリクエストに対応
    @prototypes = Prototype.all #indexアクションに、インスタンス変数@prototypesを定義し、すべてのプロトタイプの情報を代入
  end

  def new #新規投稿ページを表示するリクエストに対応
    @prototype = Prototype.new # newアクションにインスタンス変数@prototypeを定義、Prototypeモデルの新規オブジェクトを代入
  end

  def show #個別詳細ページを表示するリクエストに対応
    @comment = Comment.new
    @comments = @prototype.comments 
  end

  def create #データ投稿を行うリクエストに対応
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit #投稿の編集を行うリクエストに対応

  end

  def update #データの編集を行うリクエストに対応
    @prototype = Prototype.find(params[:id])
    # updateアクションにインスタンス変数@prototypeを定義、Pathパラメータで送信されるID値で、Prototypeモデルの特定のオブジェクトを取得するように記述し@prototypeに代入

    if @prototype.update(prototype_params) #edit.html.erbでtitle,catch_copy,concept,imageなど修正を行い、
      redirect_to prototype_path(@prototype) #もし成功すると、prototype/show.html.erb(ユーザー詳細ページ)へ遷移
      #元コード： root_path #prototype/indexへ遷移
    else
      render :edit #edit.html.erbへ移動
    end
  end


  def destroy #データを削除するリクエストに対応
    @prototype = Prototype.find(params[:id]) # destroyアクションにインスタンス変数@prototypeを定義、Pathパラメータで送信されるID値で、Prototypeモデルの特定のオブジェクトを取得するように記述し@prototypeに代入
    if @prototype.destroy 
      redirect_to root_path #prototype/indexへ移動
    else
      redirect_to root_path #prototype/indexへ移動
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end


  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end
end




#params : parameter, あるシステムの特徴的な性質を表す表現 // require : 必要とする  // permit : 〜を許可する//merge : 取り混ぜ、混合する // current : 現在// 
#render : ~ へさせる

#prototypeモデルが必要とする、データtitle, catch_copy, concept, imageのカラムを許可し、現在ローグインしているユーザーの情報に混ぜて、それをパラメータにする


# ストロングパラメータとは
# 「パラメータを受け取る際に、指定したキーを持つパラメータしか受けとれない様に制限できるもの」
#
#   private
#     def モデル名_params
#        params.require(:モデル名).permit(:カラム名1,:2,,,).merge(カラム名: 追加したいデータ値)
#     end


