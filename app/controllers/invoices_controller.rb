class InvoicesController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.invoices
    authorize @invoices
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = current_user.invoices.new
    authorize @invoice
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = current_user.invoices.new(invoice_params)
    authorize @invoice

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def populate_address_list
    user_id = params[:user_id]
    user = User.find(user_id)
    @addresses = user.addresses
    respond_to do |format|
      format.json { render json: @addresses }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
      authorize @invoice
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:user_id, :address_id, :identifier, :token, :description, :send_date, :due_date,
                                     line_items_attributes: [:id, :title, :quantity, :unit_of_measure, :unit_price, :_destroy])
    end

    def not_authorized
      redirect_to invoices_url, alert: 'Sorry, you cannot do that.'
    end
end
