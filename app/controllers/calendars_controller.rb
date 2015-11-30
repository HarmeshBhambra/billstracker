class CalendarsController < ApplicationController

  def index
    @bills = Bill.all

    @n = 0

    @week_1_bills = @bills.select{|bill| bill.due_at.day.between?(1, 7)}

    @week_2_bills = @bills.select{|bill| bill.due_at.day.between?(8, 14)}

    @week_3_bills = @bills.select{|bill| bill.due_at.day.between?(15, 21)}

    @week_4_bills = @bills.select{|bill| bill.due_at.day.between?(22, 28)}

    @week_5_bills = @bills.select{|bill| bill.due_at.day.between?(29, 31)}
  end
end
