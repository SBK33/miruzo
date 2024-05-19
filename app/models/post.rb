class Post < ApplicationRecord

#画像ファイルアップロード用の記述
  has_one_attached :image
#アソシエーション設定
  belongs_to :user

#地図表示に関する記述　わからないためいったんスキップ
#  validates :address, presence: true
#  geocoded_by :address
#  after_validation :geocode

#geocoded_by :addressで、addressカラムの内容を緯度・経度に変換することを指定しています。
#after_validation :geocodeで、バリデーションの実行後に変換処理を実行して、latitudeカラム・longitudeカラムに緯度・経度の値が入力されます。

end
