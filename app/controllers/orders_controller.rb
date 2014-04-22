class OrdersController < ApplicationController
  before_action :set_frames, only: [:new, :edit, :create, :update]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :mark_paid, :mark_completed]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @frames = Frame.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @frames = Frame.all
  end

  # GET /orders/new
  def new
    @order = Order.new
    @frames = Frame.all
  end

  # GET /orders/1/edit
  def edit
    @frames = Frame.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        @frames = Frame.all
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        @frames = Frame.all
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def mark_paid
    @order.paid_for_on = DateTime.now
    @order.save
    redirect_to orders_path, notice: 'Order paid as of today'
  end

  def mark_completed
    @order.completed_on = DateTime.now
    @order.save
    redirect_to orders_path, notice: 'Order completed as of today'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_name,
       :customer_email, :description,
        :price, :paid_for_on, :completed_on, :frame_id)
    end

    def set_frames
      # really, should be the frames for active brands
      @frames = Frame.all
    end

end
