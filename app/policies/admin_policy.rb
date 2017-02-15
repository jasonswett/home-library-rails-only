class AdminPolicy
  attr_reader :user

  def initialize(user, resource_name)
    @user = user
  end

  def index?
    true
  end
end
