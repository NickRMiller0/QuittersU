module GoogleHelper

  def login_url
      redirect_uri = ApplicationController::BASEURL + 'oauth2callback'

      url = 'https://accounts.google.com/o/oauth2/auth?' +
          'scope=' + ApplicationController::CLIENT_SCOPE + '&' +
          'redirect_uri=' + redirect_uri + '&' +
          'response_type=code&' +
          'client_id=' + ApplicationController::CLIENT_ID + '&' +
          'access_type=offline'

      URI.parse(URI.encode(url.strip))
  end

  def get_tokens(code)
    params['code'] = code
    params['client_id'] = ApplicationController::CLIENT_ID
    params['client_secret'] = ApplicationController::CLIENT_SECRET
    params['redirect_uri'] = ApplicationController::BASEURL + 'oauth2callback'
    params['grant_type'] = 'authorization_code'    

   # Initialize HTTP library
    url = URI.parse('https://accounts.google.com')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

	# Make request for tokens
	    request = Net::HTTP::Post.new('/o/oauth2/token')
	    request.set_form_data(params)
	    response = http.request(request)

	    JSON.parse(response.body)
  end

  def refresh_token(user_id)

    user = User.find(user_id)

    params['refresh_token'] = user.refresh_token
    params['client_id'] = ApplicationController::CLIENT_ID
    params['client_secret'] = ApplicationController::CLIENT_SECRET
    params['grant_type'] = 'refresh_token'

    # Initialize HTTP library
    url = URI.parse('https://accounts.google.com')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

    # Make request for tokens
    request = Net::HTTP::Post.new('/o/oauth2/token')
    request.set_form_data(params)
    response = http.request(request)

    # Parse the response
    user_tokens = JSON.parse(response.body)

    # Save the new access_token to the user 
    user.access_token = user_tokens['access_token']
    user.expires = user_tokens['expires_in']
    user.save

    # Return the new access_token
    user_tokens['access_token']
  end

  def valid_token?(access_token)

    path = '/oauth2/v1/tokeninfo'

    # Initialize HTTP library
    url = URI.parse('https://www.googleapis.com')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production

    # Make request to API
    request = Net::HTTP::Get.new(path)
    request['Authorization'] = 'Bearer ' + access_token
    response = http.request(request)

    result = JSON.parse(response.body)

    if(result['error'] != nil && result['error'] == 'invalid_token')
        false
    else
        true
    end
  end

  def call_api(path, access_token)

    # Initialize HTTP library
    url = URI.parse('https://www.googleapis.com')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production   

    # Make request to API
    request = Net::HTTP::Get.new(path)
    request['Authorization'] = 'Bearer ' + access_token
    response = http.request(request)

    JSON.parse(response.body)
  end
end