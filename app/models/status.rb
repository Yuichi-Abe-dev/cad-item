class Status < ApplicationRecord
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '展示品' },
    { id: 3, name: '販売中' },
    { id: 4, name: '非公開' }
  ]

  include ActiveHash::Associations
  has_many :items
end
