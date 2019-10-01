class CartPolicy < Struct.new(:user, :cart)
  def index?
    true
  end

  def create?
    true
  end
end
