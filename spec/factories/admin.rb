FactoryBot.define do
    factory :admin_user do
        email "example@example.com"
        password "password"
        password_confirmation "password"
    end
end
