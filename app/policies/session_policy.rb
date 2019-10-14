class SessionPolicy < Struct.new(:user, :session)
  def new?
    create?
  end

  def create?
    true
  end

  def password?
    recovery?
  end

  def recovery?
    reset?
  end

  def rereset?
    reset?
  end

  def reset?
    !user
  end
end
