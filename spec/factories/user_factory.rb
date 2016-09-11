FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		email 
    password "natdepi"
    first_name "Natalie"
    last_name "Nahil"
    admin false
  end

  factory :admin, class: User do
  	email 
    password "natdepi"
    first_name "Natalie"
    last_name "Nahil"
    admin true
  end
end
