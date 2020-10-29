class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @seller = Seller.find(params[:seller])
    return @seller
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @announcement = Announcement.find(params[:announcement])
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @announcement = Announcement.find(params[:announcement])

    @purchase = Purchase.new(announcement: @announcement, buyer_id: current_buyer.id, description: @announcement.title,seller_id: @announcement.seller.id )
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
      if @purchase.save
        #create the notifications
        Order.create(description: "ordine 2",seller:@announcement.seller,announcement: @announcement)
        Notification.create(recipient: @announcement .seller, actor: current_buyer, action: "buy" ,notifiable: @announcement)
        @user = current_buyer
        format.html { redirect_to buyer_my_purchases_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_purchases



  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:seller_id,:buyer_id, :description)
    end
end
