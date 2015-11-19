class CalendarsController < ApplicationController

  def index
    @bills = Bill.all

    @n = 0
  end
end
