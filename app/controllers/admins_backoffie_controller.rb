class AdminsBackoffieController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins_backoffice'
  def index; end
end
