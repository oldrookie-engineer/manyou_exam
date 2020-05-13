class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  scope :timelimit_order, -> { order(timelimit: :asc) }
  scope :priority_order, -> { order(priority: :asc) }
  scope :title_search, -> (title) {
    where("title Like ?", "%#{title}%")
  }
  scope :status_search, -> (status) { where(status: status)}
  enum priority:{
    高: 0,
    中: 1,
    低: 2
  }
  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labelling_labels, through: :labellings, source: :label
end
