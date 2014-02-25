module UserCredentials
  def user_credentials
    @user_credentials ||= FactoryGirl.attributes_for :me
  end
end

RSpec.configure do |config|
  config.include UserCredentials, type: :feature
end
