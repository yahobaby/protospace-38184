#commentモデル202210070050
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype
#一つのコメントは、一つのユーザーしか持てない
#一つのコメントは、一つのプロトタイプしか持てない
  validates :content, presence: true 
#バリデーション、contentカラムはpresence(存在)してる、==空は出来ない
end
