class Card < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true, length: { minimum: 3, maximum: 300 }

    scope :by_recently_created, -> { order(created_at: :desc) }
end
