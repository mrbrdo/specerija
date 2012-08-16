class FridgeItemsController < ApplicationController
  before_filter :find_fridge

  def new
    @fridge_item = @fridge.fridge_items.build
    @fridge_item.build_item
  end

  def edit
    @fridge_item = @fridge.fridge_items.find(params[:id])
  end

  def update
    @fridge_item = @fridge.fridge_items.find(params[:id])

    if @fridge_item.update_attributes(params[:fridge_item])
      redirect_to @fridge, notice: 'Fridge item was successfully updated.'
    else
      render action: "edit"
    end
  end

  def create
    @fridge_item = @fridge.fridge_items.build(params[:fridge_item])

    if @fridge_item.save
      redirect_to @fridge, notice: 'Fridge item was successfully created.'
    else
      render action: "new"
    end
  end

  def destroy
    @fridge_item = @fridge.fridge_items.find(params[:id])
    @fridge_item.destroy

    redirect_to @fridge
  end

  def remove_one
    @fridge_item = @fridge.fridge_items.find(params[:fridge_item_id])
    @fridge_item.remove_one

    redirect_to @fridge, notice: "Removed one item from fridge."
  end

private
  def find_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end
end