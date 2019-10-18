module Types
    class SellerType < BaseObject
        field :id, ID, null: false
        field :display_name, String, null: false
        field :business_name, String, null: false
        field :user, UserType, null: false
        field :bank_name, String, null: false
        field :bank_location, String, null: false
        field :bank_account_number, String, null: false
        field :registered_for_vat, String, null: false
        field :description, String , null: false
        field :website, String, null: false
        
    end

   
end