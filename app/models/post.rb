class Post < ActiveRecord::Base
  attr_accessible :title, :description, :price, :email
  before_create :generate_secret_key
  
  belongs_to :category

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :title,       presence: true
  validates :email, :presence => true,
                    :format   => { :with => email_regex }  
  validates :description, presence: true




  private

  def generate_secret_key
    self.secret_key = SecureRandom.hex(4)
  end

end

