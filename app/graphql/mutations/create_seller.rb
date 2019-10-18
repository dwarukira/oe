module Mutations
    class CreateSeller < BaseMutation
        
        class SellerInputType < Types::BaseInputObject
            argument :display_name, String, required: true
            argument :username, String, required: true
            argument :phone_number, String, required: true
            argument :email , String, required: true
            argument :password, String, required: true
            argument :password_confirmation, String, required: true
            argument :business_name, String, required: true
            argument :bank_name , String, required: true
            argument :bank_location, String , required: false
            argument :bank_account_number, String, required: false
            argument :registered_for_vat, String , required: false
            argument :description, String , required: false
            argument :website, String , required: false
            argument :bank_account_holders_name, String, required: false

        end

        argument :input, SellerInputType, required: false

        type Types::SellerType

    
        def resolve(input: nil)
            # binding.pry
            create_user = User.create!(
                name: input.username,
                email: input.email,
                phone: input.phone_number,
                password: input.password,
                password_confirmation: input.password_confirmation,
            )

            Seller.create(
                user: create_user,
                display_name: input.display_name,
                business_name: input.business_name,
                website: input.website,
                bank_name: input.bank_name,
                bank_location: input.bank_location,
                bank_account_number: input.bank_account_number,
                registered_for_vat: input.registered_for_vat,
                description: input.description,              
            )
        end
    end
end