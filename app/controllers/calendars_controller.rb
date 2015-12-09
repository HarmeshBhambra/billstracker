class CalendarsController < ApplicationController

  def index
    @bills = Bill.all

    @n = 0

    @month = params[:month]

    @week_1_bills = current_user.bills.select{|bill| bill.due_at.day.between?(1, 7)}

    @week_1_bills_mon = @week_1_bills.select{|bill| bill.due_at.mon.to_s.include? @month.to_s}

    @week_2_bills = current_user.bills.select{|bill| bill.due_at.day.between?(8, 14)}

    @week_2_bills_mon = @week_2_bills.select{|bill| bill.due_at.mon.to_s.include? @month.to_s}

    @week_3_bills = current_user.bills.select{|bill| bill.due_at.day.between?(15, 21)}

    @week_3_bills_mon = @week_3_bills.select{|bill| bill.due_at.mon.to_s.include? @month.to_s}

    @week_4_bills = current_user.bills.select{|bill| bill.due_at.day.between?(22, 28)}

    @week_4_bills_mon = @week_4_bills.select{|bill| bill.due_at.mon.to_s.include? @month.to_s}

    @week_5_bills = current_user.bills.select{|bill| bill.due_at.day.between?(29, 31)}

    @week_5_bills_mon = @week_5_bills.select{|bill| bill.due_at.mon.to_s.include? @month.to_s}

    @total_bills_mon = current_user.bills.select{|bill| bill.due_at.mon.to_s.include? @month.to_s}

    @p = 0
    current_user.bills.each do |bill|
      if bill.payments.map{|item| item.amount_paid}.sum == bill.amount
      @p = @p + 1
      end
    end
  end
end
