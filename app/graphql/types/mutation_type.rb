module Types
    class MutationType < BaseObject
        field :create_user, mutation: Mutations::CreateUser
        field :sign_in, mutation: Mutations::SignIn 
        field :create_seller, mutation: Mutations::CreateSeller
        field :create_product, mutation: Mutations::CreateProduct
    end
  end