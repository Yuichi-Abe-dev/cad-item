class Software < ApplicationRecord
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Revit' },
    { id: 3, name: 'Dynamo' },
    { id: 4, name: 'Rhinoceros' },
    { id: 5, name: 'Grasshopper' }
  ]

  include ActiveHash::Associations
  has_many :items
end
