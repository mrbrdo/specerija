class FridgeItemsController < ApplicationController
  before_filter :find_fridge

  def new
    @fridge_item = @fridge.fridge_items.build
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

  private
  def find_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end
end