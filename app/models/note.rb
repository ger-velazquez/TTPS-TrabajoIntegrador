class Note < ApplicationRecord
  belongs_to :book
  validates_uniqueness_of :title, scope: :book_id

end
