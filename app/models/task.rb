class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  scope :status_like, -> (params) {where(status: params[:status])}
end
