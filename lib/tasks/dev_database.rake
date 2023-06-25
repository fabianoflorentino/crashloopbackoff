# frozen_string_literal: true

namespace :dev do
  desc 'Setup a development database'
  task setup_database: :environment do
    if Rails.env.development?
      show_spinner('Droping database...') { `rails db:drop` }
      show_spinner('Creating database...') { `rails db:create` }
      show_spinner('Setuping database...') { `rails db:migrate` }
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Done!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end)
  end
end
