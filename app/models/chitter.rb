class Chitter < ApplicationRecord
    validates :tweet, presence: true
    validates :tweet, length: { in:1..140 }
end