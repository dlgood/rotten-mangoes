class User < ActiveRecord::Base

  has_many :reviews, dependent: :destroy

  has_secure_password

  def show
    @user = User.find(params[:id])
  end


  def full_name
    "#{firstname} #{lastname}"
  end

end
