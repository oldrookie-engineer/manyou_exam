class User < ApplicationRecord
  validates :name, presence:true, length: {maximum: 30}
  validates :email, presence:true, length: {maximum: 255},
  uniqueness:true,
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence:true, unless: :password_digest
  before_destroy :admin_destroy_check
  after_update :admin_update_check
  has_many :tasks, dependent: :destroy

  def admin_destroy_check
    if User.where(admin: true).count <= 1 && self.admin == true
      throw(:abort)
    end
  end

  def admin_update_check
    if User.where(admin: true).count == 0
      raise ActiveRecord::RecordInvalid, self
    end
  end
end
