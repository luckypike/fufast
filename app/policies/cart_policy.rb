class CartPolicy < Struct.new(:user, :cart)
  def index?
    true
  end
end
