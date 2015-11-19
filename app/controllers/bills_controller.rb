class BillsController < ApplicationController
  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
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
    @bill.due_at = params[:due_at]
    @bill.amount = params[:amount]
    @bill.category = params[:category]
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
    @bill.category = params[:category]
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
