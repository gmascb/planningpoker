class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      
      #raise auth.provider
      if user.provider != 'github'
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      
      if user.provider == 'github'
        #user.email = auth.info.email
      end
      
      user.save!
    end
  end
end