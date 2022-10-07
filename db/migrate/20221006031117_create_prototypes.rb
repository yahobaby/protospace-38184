# データベースに異常発生で、やり直し202210061213
class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text   :catch_copy
      t.text   :concept
      t.references :user, null: false, foreign_key: true #references型を用い, userを参照するための外部キーを記述
      t.timestamps
    end
  end
end
