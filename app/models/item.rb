class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :item_image

  validates :item_image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image(width, height)
    # fallback valueの設定を入れること
    # if item_image.attached?
    item_image.variant(resize_to_limit: [width, height]).processed
    # else
    #   何かしらの理由で画像登録が無いとき、ダミー画像を表示 asset_pathなどが良いかも
    # end
  end

  def price_with_tax
    (self.price * 1.08).floor
  end
end
