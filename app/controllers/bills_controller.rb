class BillsController < ApplicationController
  before_action :current_user_must_be_owner, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_owner
    @bill = Bill.find(params[:id])
    if current_user != @bill.user
      redirect_to "/", :alert => "You can only view bills you have created. Go to 'Bills'."
    end
  end

  def image
    @bill = Bill.find(params[:id])
  end

  def index
    @current_user_bills = Bill.where({:user_id => current_user.id})
    @q = @current_user_bills.ransack(params[:q])
    @bills = @q.result
  end

  def show
    @bill = Bill.find(params[:id])
    @payment = Payment.new
    @percentage_paid = (@bill.payments.map{|item| item.amount_paid}.sum) / (@bill.amount)
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new
    @bill.image = params[:image]
    @bill.user_id = params[:user_id]
    @bill.notes = params[:notes]
    @bill.recurring = params[:recurring]
    @bill.due_at = Chronic.parse(params[:due_at])
    @bill.amount = params[:amount]
    @bill.category_id = params[:category_id]
    @bill.company = params[:company]
    @bill.name = params[:name]

    if @bill.save
      redirect_to "/bills", :notice => "Bill created successfully."
    else
      render 'new'
    end
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])

    @bill.image = params[:image]
    @bill.user_id = params[:user_id]
    @bill.notes = params[:notes]
    @bill.recurring = params[:recurring]
    @bill.due_at = params[:due_at]
    @bill.amount = params[:amount]
    @bill.category_id = params[:category_id]
    @bill.company = params[:company]
    @bill.name = params[:name]

    if @bill.save
      redirect_to "/bills", :notice => "Bill updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @bill = Bill.find(params[:id])

    @bill.destroy

    redirect_to "/bills", :notice => "Bill deleted."
  end
end
