class BookstoresController < ApplicationController
  before_action :set_bookstore, only: [:show, :edit, :update, :destroy]

  # GET /bookstores
  # GET /bookstores.json
  def index
    p "WWWWW"
    @bookstores = Bookstore.all
  end

  # GET /bookstores/1
  # GET /bookstores/1.json
  def show
  end

  # GET /bookstores/new
  def new
    @bookstore = Bookstore.new
  end

  # GET /bookstores/1/edit
  def edit
  end

  # POST /bookstores
  # POST /bookstores.json
  def create
    @bookstore = Bookstore.new(bookstore_params)

    respond_to do |format|
      if @bookstore.save
        format.html { redirect_to :action => :index, notice: 'Bookstore was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bookstore }
      else
        format.html { render action: 'new' }
        format.json { render json: @bookstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookstores/1
  # PATCH/PUT /bookstores/1.json
  def update
    respond_to do |format|
      if @bookstore.update(bookstore_params)
        format.html { redirect_to :action => :index, notice: 'Bookstore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookstores/1
  # DELETE /bookstores/1.json
  def destroy
    p "destroy    ddddddd"
    @bookstore.destroy
    #respond_to do |format|
    #  format.html { redirect_to :action => :index }
    #  format.json { head :no_content }
    #end
    #redirect_to :action => :index,:method => :get
    @bookstores = Bookstore.all
    render :action => :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookstore
      @bookstore = Bookstore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookstore_params
      params.require(:bookstore).permit(:name)
    end
end
