# frozen_string_literal: true

DEFAULT_PASSWORD = 'password'

namespace :dev do
  desc 'Setup Development Environment'
  task setup: :environment do
    if Rails.env.development?
      `rails dev:setup_database`
      `rails dev:setup_admin`
      `rails dev:setup_user`
    end
  end
end
