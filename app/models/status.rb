class Status < ApplicationRecord
  validates :text, presence: true, length: { maximum: 140 }
end
