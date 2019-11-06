describe 'Users endpoint' do
  it 'Logs in a user' do
    user = create(:user)
    body = {
      "email": user.email,
      "password": user.password,
    }
    post '/api/v1/sessions', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:api_key]).to be_a String
  end

  it 'Bad submissions will render an error' do
    body = {
      "email": "notarealemail@mail.com",
      "password": "password",
    }
    post '/api/v1/sessions', params: body, as: :json

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors][:'email or password']).to eq(['is invalid'])
  end
end
