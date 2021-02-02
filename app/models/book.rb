class Book < ApplicationRecord
    has_many :notes
    validates :title, presence: true, length: {maximum: 50}
    validates_uniqueness_of :title, scope: :user_id
    
    
    validates_associated :notes
end
