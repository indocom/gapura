class Admin::AdminController < ApplicationController
  before_action :ensure_admin

  def index
  end
end
