class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json


  # GET /transactions/new
  def new
    @announcement = Announcement.find(params[:announcement])
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @announcement = Announcement.find('1')
    key = @announcement.seller.access_code
    Stripe.api_key = key

  
    token = params[:stripeToken]

    customer = if current_buyer.stripe_id?
                Stripe::Customer.retrieve(current_buyer.stripe_id)
              else
                Stripe::Customer.create(email: current_buyer.email, source: token)
              end

              payment_intent = Stripe::PaymentIntent.create({
                customer:customer,
                payment_method_types: ['card'],
                amount: 8000,
                currency: 'eur',
                confirm: true, 
              }, stripe_account: @announcement.seller.uid)

    
    redirect_to root_path, notice: payment_intent.status + " Your transaction was setup successfully!"
 
  end

  


  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:description)
    end
end
