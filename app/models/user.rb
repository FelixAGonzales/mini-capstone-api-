class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def index
    @user = User.all
    render :index
  end
end
