class Opinion < ApplicationRecord
    belongs_to :user

    validates presence: true, length: {minimum: 5, maximum: 255}
end
