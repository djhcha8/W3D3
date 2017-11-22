class User < ApplicationRecord 
  validates :email, uniqueness: true, presence: true 
  
  has_many :submitions,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :user_id
  
  def submitted_urls
    submissions = self.submitions 
    res = []
    submissions.each do |submiss|
      res << submiss.long_url
    end 
    res 
  end
end 