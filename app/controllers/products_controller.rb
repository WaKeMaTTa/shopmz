class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :need_login, except: [:index]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    
    @products = @products.by_category(params[:category]) if params[:category].present?

    @products = @products.by_manufacturer(params[:manufacturer]) if params[:manufacturer].present?
    
    @products = @products.registred_at(params[:registred_at]) if params[:registred_at].present?
    
    @products = @products.more_quantity(params[:more_quantity]) if params[:more_quantity].present?
    @products = @products.less_quantity(params[:less_quantity]) if params[:less_quantity].present?

    @products = @products.more_price(params[:more_price]) if params[:more_price].present?
    @products = @products.less_price(params[:less_price]) if params[:less_price].present?

    #params.each do |key, value|
     # if key == "category" and value.presence
     #   @products = Product.by_category(value)
     # end
    #e#nd
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :registred_at, :manufacturer, :quantity, :price, :category)
    end

    # Parametros para filtrar la lista
    def filter_params(params)
      params.slice(:category)
    end
end
