class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_invoice

  def index
    @line_items = @invoice.line_items
  end

  def show
  end

  def new
    @line_item = @invoice.line_items.new
  end

  def create
    @line_item = @invoice.line_items.new(line_item_params)

    if @line_item.save
      redirect_to @invoice, notice: 'Line item added successfully!'
    else
      redirect_to @invoice, alert: 'Sorry, the line item was not added.'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_invoice
    @invoice = Invoice.find params[:invoice_id]
  end

  def set_line_item
    @line_item = LineItem.find params[:id]
    authorize @line_item
  end

  def line_item_params
    params.require(:line_item).permit(:title, :unit_price, :quantity, :unit_of_measure)
  end
end
