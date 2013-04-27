require 'factory_girl'

FactoryGirl.define do
  sequence(:random_title) {|n| "New Question ##{n}}" }
  sequence(:random_content) {|n| "Content ##{n}}" }
  sequence(:random_tag_list) {|n| "sample_tag, sample_tag#{n}}" }

  factory :question, class: SimonAsks::Question do
    title { generate(:random_title) }
    content { generate(:random_content) }
    tag_list { generate(:random_tag_list) }
  end

end