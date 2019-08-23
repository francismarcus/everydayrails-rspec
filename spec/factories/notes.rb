FactoryBot.define do
  factory :note do
    message "My note"
    association :project
    user { project.owner }
  end
end
