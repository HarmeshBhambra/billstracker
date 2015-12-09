class PaymentsController < ApplicationController
    before_action :current_user_must_be_owner, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_owner
    @payment = Payment.find(params[:id])
    if current_user != @payment.bill.user
      redirect_to "/", :alert => "You can only view payments you have created. Go to 'Payments'."
    end
  end

  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new
    @payment.paid_at = params[:paid_at]
    @payment.amount_paid = params[:amount_paid]
    @payment.bill_id = params[:bill_id]
    @payment.notes = params[:notes]

    if @payment.save
      redirect_to "/payments", :notice => "Payment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])

    @payment.paid_at = params[:paid_at]
    @payment.amount_paid = params[:amount_paid]
    @payment.bill_id = params[:bill_id]
    @payment.notes = params[:notes]

    if @payment.save
      redirect_to "/payments", :notice => "Payment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])

    @payment.destroy

    redirect_to "/payments", :notice => "Payment deleted."
  end
end
