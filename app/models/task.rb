class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: {in: 0..140}
end
