class Post < ActiveRecord::Base
  attr_accessible :title, :description, :price, :email
  before_save :generate_secret_key
  
  belongs_to :category


  private

  def generate_secret_key
    self.secret_key = SecureRandom.hex(4)
  end

end

