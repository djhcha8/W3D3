class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true
  
  belongs_to :submit_person,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id
  
  def submitter 
    s = self.submit_person
    s.email 
  end 
  
  def self.random_code 
    SecureRandom.urlsafe_base64
  end 
  
  #long pass in, getting different short 
  #same user, can't create same long url 
  def self.create_shortened_url(user, long_url)
    #same user shortening same long_url 
    #different user shortening same long_url     
    record = self.find_by(long_url: long_url, user_id: user.id )
    if record.nil?
      val = self.find_by(long_url: long_url)
      if val.nil? #long does not exist 
        short_val = self.random_code
        while ShortenedUrl.exists?(short_url: short_val)
          short_val = self.random_code
        end
        self.create(long_url: long_url, short_url: short_val, user_id: user.id)
      else #long exist 
        self.create(long_url: long_url, short_url: val.short_url, user_id: user.id)
      end
    end  
  end 
  
  
  
end