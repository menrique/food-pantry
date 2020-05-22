module Auth
  def self.decoded_jwt_token(response)
    token_from_request = response.headers['Authorization'].split(' ').last
    JWT.decode(token_from_request, ENV['AUTH_SECRET_KEY'], true)
  end
end