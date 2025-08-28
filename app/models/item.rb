class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :item_image

  validates :item_image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def price_with_tax
    (self.price * 1.08).floor
  end
end
