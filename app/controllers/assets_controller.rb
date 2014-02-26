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

  def file
    @asset = Asset.find params[:id]
    send_data @asset.file.read, type: @asset.file.file.content_type, disposition: 'inline'
  end
end
