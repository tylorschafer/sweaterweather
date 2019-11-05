FactoryBot.define do
  factory :user do
    email { 'fakeemail@email.com' }
    password { 'password' }
    token { 'faketoken' }
  end
end
