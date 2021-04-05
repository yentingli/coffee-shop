class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to products_path, notice: '新增產品成功!'
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])

    if @product.update(product_params)
      redirect_to products_path, notice: '產品資料更新成功!'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy if @product
    redirect_to products_path, notice: '產品資料已刪除'
  end


  private
  def product_params
    params.require(:product).permit(:name, :source, :area, :stock, :flavor)
  end
end
