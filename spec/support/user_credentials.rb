module UserCredentials
  def user_credentials
    @user_credentials ||= FactoryGirl.attributes_for :me
  end

  def auth_me!
    me = FactoryGirl.create :user, user_credentials
    visit login_path(me.id)
  end
end

RSpec.configure do |config|
  config.include UserCredentials, type: :feature
end
