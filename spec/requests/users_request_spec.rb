describe 'Users endpoint' do
  it 'Creates a new user' do
    body = {
      "email": "fake_user@user.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:api_key]).to be_a String
  end

  it 'Bad submissions will render an error' do
    body = {
      "email": "fake_user@user.com",
      "password": "password",
      "password_confirmation": "badpassword"
    }
    post '/api/v1/users', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors][:password_confirmation]).to eq(["doesn't match Password"])
  end
end
