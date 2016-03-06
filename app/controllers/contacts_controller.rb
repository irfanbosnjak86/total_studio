class ContactsController < ApplicationController
  before_action :set_admin_contact, only: [:show]

  # GET /admin/contacts/1
  # GET /admin/contacts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_contact
      @contact = Contact.last
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_contact_params
      params.require(:contact).permit(:title, :description)
    end
end
