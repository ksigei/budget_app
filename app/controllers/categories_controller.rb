class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # load_and_authorize_resource

  # GET /categories or /categories.json
  def index
    @categories = Category.where(user_id: current_user.id)
    @transactions = Transaction.joins(:category).where(categories: { user_id: current_user.id })
    
    @total = 0
    @transactions.each do |transaction|
      @total += transaction.amount
    end


  end
    
  # GET /categories/1 or /categories/1.json
  def show
    @transactions = Transaction.where(category_id: @category.id)
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit

  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by(id: params[:id], user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
    end
end
