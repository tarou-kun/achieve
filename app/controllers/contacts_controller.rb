class ContactsController < ApplicationController
  def new
    if params[:back]
    @contacts = Contact.new(contacts_params)
  else
    @contacts = Contact.new
    end
  end

  def create
    @contacts = Contact.new(contacts_params)
    if @contacts.save
      redirect_to root_path, flash: {notice:"お問い合わせが完了しました！"}
    else
      render action: 'new'
    end
  end
  
  def confirm
    @contacts = Contact.new(contacts_params)
    render :new if @contacts.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end