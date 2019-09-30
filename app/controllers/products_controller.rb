class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json do
        # TODO: тут загрузить остальные параметры товара для продажы
      end
    end
  end
end
