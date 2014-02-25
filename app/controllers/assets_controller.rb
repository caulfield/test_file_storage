class AssetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assets = []
  end
end
