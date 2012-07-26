
class ItemsController < ApplicationController
  before_filter :find_fridge

  # GET /items/1
  # GET /items/1.json
  def show
    @item = @fridge.items.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = @fridge.items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = @fridge.items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = @fridge.items.build(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @fridge, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = @fridge.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @fridge, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = @fridge.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @fridge }
      format.json { head :no_content }
    end
  end

private
  def find_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end
end
