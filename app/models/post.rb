class Post < ApplicationRecord

#画像ファイルアップロード用の記述
  has_one_attached :image
#アソシエーション設定
  belongs_to :user

#画像添付用メソッド
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode
#geocoded_by :addressで、addressカラムの内容を緯度・経度に変換することを指定しています。
#after_validation :geocodeで、バリデーションの実行後に変換処理を実行して、latitudeカラム・longitudeカラムに緯度・経度の値が入力されます。

end
