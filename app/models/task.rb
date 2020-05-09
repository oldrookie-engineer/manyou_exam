class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  scope :timelimit_order, -> { order(timelimit: :asc) }
  scope :title_search, -> (title) {
    where("title Like ?", title)
  }
  scope :status_search, -> (status) { where(status: status)}
  enum priority:{
    高: 0,
    中: 1,
    低: 2
  }
end
