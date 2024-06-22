class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#アソシエーション設定
  has_many :posts, dependent: :destroy

#画像の添付設定
  has_one_attached :profile_image
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample_user.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
#ai質問できるタイミングで上記のリサイズ失敗しているエラー原因確認する
  end
  validates :name,
    uniqueness: true,
    length: { in: 2..20 }
end
