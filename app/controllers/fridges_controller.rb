
class FridgesController < ApplicationController
  # GET /fridges
  # GET /fridges.json
  def index
    @fridges = Fridge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fridges }
    end
  end

  # GET /fridges/1
  # GET /fridges/1.json
  def show
    @fridge = Fridge.find(params[:id])
    @items = @fridge.items # for _item_list.html.erb

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fridge }
    end
  end

  # GET /fridges/new
  # GET /fridges/new.json
  def new
    @fridge = Fridge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fridge }
    end
  end

  # GET /fridges/1/edit
  def edit
    @fridge = Fridge.find(params[:id])
  end

  # POST /fridges
  # POST /fridges.json
  def create
    @fridge = Fridge.new(params[:fridge])

    respond_to do |format|
      if @fridge.save
        format.html { redirect_to @fridge, notice: 'Fridge was successfully created.' }
        format.json { render json: @fridge, status: :created, location: @fridge }
      else
        format.html { render action: "new" }
        format.json { render json: @fridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fridges/1
  # PUT /fridges/1.json
  def update
    @fridge = Fridge.find(params[:id])

    respond_to do |format|
      if @fridge.update_attributes(params[:fridge])
        format.html { redirect_to @fridge, notice: 'Fridge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fridge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fridges/1
  # DELETE /fridges/1.json
  def destroy
    @fridge = Fridge.find(params[:id])
    @fridge.destroy

    respond_to do |format|
      format.html { redirect_to fridges_url }
      format.json { head :no_content }
    end
  end
end
