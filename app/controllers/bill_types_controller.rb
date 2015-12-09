class BillTypesController < ApplicationController
  def index
    @bill_types = BillType.all
  end

  def show
    @bill_type = BillType.find(params[:id])
  end

  def new
    @bill_type = BillType.new
  end

  def create
    @bill_type = BillType.new
    @bill_type.type = params[:type]

    if @bill_type.save
      redirect_to "/bill_types", :notice => "Bill type created successfully."
    else
      render 'new'
    end
  end

  def edit
    @bill_type = BillType.find(params[:id])
  end

  def update
    @bill_type = BillType.find(params[:id])


    if @bill_type.save
      redirect_to "/bill_types", :notice => "Bill type updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @bill_type = BillType.find(params[:id])

    @bill_type.destroy

    redirect_to "/bill_types", :notice => "Bill type deleted."
  end
end
