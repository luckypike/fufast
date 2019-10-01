class SessionPolicy < Struct.new(:user, :session)
  def new?
    create?
  end

  def create?
    true
  end
end
