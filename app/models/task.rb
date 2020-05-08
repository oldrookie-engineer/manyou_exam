class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  scope :deadline_order, -> { order(deadline: :asc) }
  scope :title_search, -> (title) {
    where("title Like ?", title)
  }
  scope :status_search, -> (status) { where(status: status)}
end
