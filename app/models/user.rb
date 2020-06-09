class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.last_login = DateTime.now

      if user.provider != 'github'
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      
      user.save!
      
    end
  end

  scope :logados, -> { where("last_login > '#{DateTime.now - 3.month}' OR last_login IS NULL ") }

end