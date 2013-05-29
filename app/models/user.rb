class User < ActiveRecord::Base
  attr_accessible :age, :dob, :name, :photo
  has_attached_file :photo , :styles => { :small => "150x150>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => {
                              :bucket => ENV['s3_bucket'],
                              :access_key_id => ENV['s3_access_key_id'],
                              :secret_access_key => ENV['s3_secret_access_key']
                    }
#, :default_url => "/images/:style/missing.png",
# :url  => "/assets/users/:id/:style/:basename.:extension",
# :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
end
