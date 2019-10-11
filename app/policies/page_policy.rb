class PagePolicy < Struct.new(:user, :page)
  def index?
    true
  end

  def about?
    true
  end

  def contacts?
    true
  end

  def logo?
    true
  end
end
