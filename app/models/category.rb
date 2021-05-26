class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '建築・土木' },
    { id: 3, name: '製品設計・製造' },
    { id: 4, name: '映画・VFX' },
    { id: 5, name: 'ゲーム・VR' }
  ]

  include ActiveHash::Associations
  has_many :items
end
