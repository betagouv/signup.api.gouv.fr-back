FactoryBot.define do
  sequence(:email) { |n| "user#{n}@whatever.gouv.fr" }

  factory :user do
    email

    trait :administrator do
      roles do
        %w[
          administrator
        ]
      end
    end

    trait :dpo do
      with_personal_information
    end

    trait :responsable_traitement do
      with_personal_information
    end

    trait :with_personal_information do
      given_name { "Jean" }
      family_name { "Dupont" }
      phone_number { "0636656565" }
      job { "Administrateur" }
    end

    trait :with_all_infos do
      with_personal_information
      administrator

      organizations do
        [
          build(:organization, :dinum)
        ]
      end
    end
  end
end
