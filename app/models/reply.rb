class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates presence: true, length: { minimum: 5, maximum: 255 }
end
