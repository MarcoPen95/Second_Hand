class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @seller = Seller.find(params[:seller])
    return @seller
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @announcement = Announcement.find(params[:announcement])
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @announcement = Announcement.find(params[:announcement])

    @transaction = Transaction.new(buyer_id: current_buyer.id, description: @announcement.title,seller_id: @announcement.seller.id )
    key = @announcement.seller.access_code
    Stripe.api_key = key

    token = params[:stripeToken]

    customer = if current_buyer.stripe_id?
                Stripe::Customer.retrieve(current_user.stripe_id)
              else
                Stripe::Customer.create(email: current_buyer.email, source: token)
              end

              payment_intent = Stripe::PaymentIntent.create({
                customer:customer,
                payment_method_types: ['card'],
                amount: @announcement.price.to_i * 100,
                currency: 'eur',
                confirm: true, 
              }, stripe_account: @announcement.seller.uid)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to buyer_my_transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_transactions



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
      params.require(:transaction).permit(:seller_id,:buyer_id, :description)
    end
end
