class SoldoutOrExhibiting < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: '出品中' },
    { id: 2, name: '売却済' },
  ]
end