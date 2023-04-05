# frozen_string_literal: true

FactoryBot.define do
    factory :project, class: Project do
      title { 'Test Project' }
      description { 'Test Project Description' }
      type { 'external' }
      location { 'Korea' }
      association :user, factory: :user
    end
  end