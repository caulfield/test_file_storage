class AssetDecorator < Draper::Decorator
  delegate_all

  def user
    source.user.email
  end
end
