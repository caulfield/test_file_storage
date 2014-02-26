class AssetsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @assets = Asset.all
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.create params.for(Asset).refine
    respond_with @asset, location: root_path
  end
end
