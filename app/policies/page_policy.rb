class PagePolicy < Struct.new(:user, :page)
  def index?
    true
  end

  def about?
    true
  end
end
