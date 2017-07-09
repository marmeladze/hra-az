class Admin::ContactsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "geometry123"
  before_action :set_contact, only: [:edit, :update, :destroy]
  
  layout "admin"
  
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end


  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to admin_contacts_url, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to admin_contacts_url, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to admin_contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end


  def contact_params
    params.require(:contact).permit(:phone, :email, :twitter, :facebook, :address)
  end

end