class Note < ApplicationRecord
  has_rich_text :content
  belongs_to :book
  validates_uniqueness_of :title, scope: :book_id

end
