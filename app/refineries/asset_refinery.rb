class AssetRefinery < ApplicationRefinery

  def create
    [:name, :file]
  end

end
