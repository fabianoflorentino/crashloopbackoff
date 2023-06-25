# frozen_string_literal: true

namespace :dev do
  if Rails.env.development?
    desc 'Setup a development default administration'
    task setup_admin: :environment do
      show_spinner('Registering the default administrator...') do
        Admin.create!(email: 'admin@example.com', password: DEFAULT_PASSWORD, password_confirmation: DEFAULT_PASSWORD)
      end
    end

    desc 'Setup a development default user'
    task setup_user: :environment do
      show_spinner('Registering the default user...') do
        User.create!(email: 'user@example.com', password: DEFAULT_PASSWORD, password_confirmation: DEFAULT_PASSWORD)
      end
    end
  end
end
