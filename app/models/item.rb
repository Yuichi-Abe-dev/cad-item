class Item < ApplicationRecord
  belongs_to :category
  belongs_to :software
  belongs_to :operating_system
  belongs_to :status
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image, :name, :description, :version
    with_options numericality: { other_than: 1 } do
      validates :category_id, :software_id, :operating_system_id, :status_id
    end
  end
end
