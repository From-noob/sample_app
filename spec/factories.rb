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
    u.sequence(:name) { |n| "Person #{n}" }
    u.sequence(:email) { |n| "person_#{n}#{Time.now.to_i}@abc.com" }
    u.password 'foobar'
    u.password_confirmation 'foobar'
    factory :admin do
      admin true
    end
  end
end
