class AuthenticationTokenService
  def self.call
    hmac_secret = 'my$ecretK3y'
    payload = {"test" => 'what'}

    JWT.encode payload, hmac_secret, 'HS256'
  end
end
