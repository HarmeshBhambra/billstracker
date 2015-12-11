class CalendarsController < ApplicationController

  def index
    @bills = Bill.all

    @n = 0

    @month = params[:month]

    # For number of bills paid or unpaid
    @p = 0
    current_user.bills.each do |bill|
      if bill.payments.map{|item| item.amount_paid}.sum == bill.amount
      @p = @p + 1
      end
    end

    # Default month is current month or filtered month
    if @month.to_i >= 1
        @mon = @month
      else
        @mon = Time.now.mon
    end

    @current_month = Time.now.mon

    # Months for dropdown filter

    @sort_bills_due_at = @bills.sort_by{|bill| bill.due_at}

    @first_bill_due = @sort_bills_due_at.first

    @last_bill_due = @sort_bills_due_at.last

    # Calculations for table
    @week_1_bills = current_user.bills.select{|bill| bill.due_at.day.between?(1, 7)}

    @week_2_bills = current_user.bills.select{|bill| bill.due_at.day.between?(8, 14)}

    @week_3_bills = current_user.bills.select{|bill| bill.due_at.day.between?(15, 21)}

    @week_4_bills = current_user.bills.select{|bill| bill.due_at.day.between?(22, 28)}

    @week_5_bills = current_user.bills.select{|bill| bill.due_at.day.between?(29, 31)}

    @total_bills_mon = current_user.bills.select{|bill| bill.due_at.mon.to_s === @mon.to_s}

  end
end
