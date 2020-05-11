class User < ApplicationRecord
  validates :name, presence:true
  validates :email, presence:true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence:true, unless: :password_digest
  before_destroy :admin_destroy_check
  before_update :admin_update_check
  has_many :tasks, dependent: :destroy

  def admin_destroy_check
    if User.where(admin: true).count <= 1 && self.admin == true
      throw(:abort)
    end
  end

  def admin_update_check
    if User.where(admin: true).count <= 1 && self.admin == false
      throw(:abort)
    end
  end

end
