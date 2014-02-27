class AssetsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @assets = AssetDecorator.decorate_collection Asset.includes(:user).order(created_at: -1)
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.new params.for(Asset).refine
    @asset.user = current_user
    @asset.save
    respond_with @asset, location: root_path
  end

  def file
    @asset = Asset.find params[:id]
    send_data @asset.file.read, type: @asset.file.file.content_type, disposition: 'inline'
  end
end
