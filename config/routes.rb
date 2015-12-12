Rails.application.routes.draw do
  # Routes for the Category resource:
  # CREATE
  get "/categories/new", :controller => "categories", :action => "new"
  post "/create_category", :controller => "categories", :action => "create"

  # READ
  get "/categories", :controller => "categories", :action => "index"
  get "/categories/:id", :controller => "categories", :action => "show"

  # UPDATE
  get "/categories/:id/edit", :controller => "categories", :action => "edit"
  post "/update_category/:id", :controller => "categories", :action => "update"

  # DELETE
  get "/delete_category/:id", :controller => "categories", :action => "destroy"
  #------------------------------

  # Routes for the Calendar resource:
  get "/", :controller => "calendars", :action => "index"

  # Routes for the Payment resource:
  # CREATE
  get "/payments/new", :controller => "payments", :action => "new"
  post "/create_payment", :controller => "payments", :action => "create"

  # READ
  get "/payments", :controller => "payments", :action => "index"
  get "/payments/:id", :controller => "payments", :action => "show"

  # UPDATE
  get "/payments/:id/edit", :controller => "payments", :action => "edit"
  post "/update_payment/:id", :controller => "payments", :action => "update"

  # DELETE
  get "/delete_payment/:id", :controller => "payments", :action => "destroy"
  #------------------------------

  # Routes for the Bill resource:
  # CREATE
  get "/bills/new", :controller => "bills", :action => "new"
  post "/create_bill", :controller => "bills", :action => "create"

  # READ
  get "/bills", :controller => "bills", :action => "index"
  get "/bills/:id", :controller => "bills", :action => "show"

  # UPDATE
  get "/bills/:id/edit", :controller => "bills", :action => "edit"
  post "/update_bill/:id", :controller => "bills", :action => "update"

  # DELETE
  get "/delete_bill/:id", :controller => "bills", :action => "destroy"

  # BILL IMAGE
  get "/bills/:id/image", :controller => "bills", :action => "image"
  #------------------------------

  devise_for :users

end
