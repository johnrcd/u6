class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  def missing_email
    @customers = Customer.where("email IS ? ", "").order(full_name: :asc)
  end
  def alphabetized
    @customers = Customer.order(full_name: :asc)
  end
  def show
    @customer = Customer.find(params[:id])
  end
end
