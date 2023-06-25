class ProfilesBackoffieController < ApplicationController
  before_action :authenticate_profile!
  layout 'profiles_backoffice'
  def index; end
end
