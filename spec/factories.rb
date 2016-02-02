# FactoryGirl.define do
#   factory :user do
#     name	"Michael Hartl"
#     email	"user#{Time.now.to_i}@example.com"
#     password				'foobar'
#     password_confirmation	'foobar'
#   end
# end

FactoryGirl.define do
  factory :user do |u|
    u.name 'Michael Hartl'
    u.sequence(:email) { |n| "mike#{n}#{Time.now.to_i}@abc.com" }
    u.password 'foobar'
    u.password_confirmation 'foobar'
  end
end
