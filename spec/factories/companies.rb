FactoryBot.define do
    factory :company do
        sequence :company_name do |n|
            "Test Company name #{n}"
        end

        email {"test email"}
        manager_name {'Test manager'}
        abn {'Test ABN'}
        website {'Test website'}
        contact_number {'Test number'}
        address {'Test address'}
        suburb {'Test suburb'}
        state {'Test state'}
    

        trait :invalid do
          company_name { nil }

        end
    end
end