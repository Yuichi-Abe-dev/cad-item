class OperatingSystem < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Microsoft Windows' },
    { id: 3, name: 'macOS' },
  ]

  include ActiveHash::Associations
  has_many :items
end
