module Mutations
    class CreateUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :email, Types::AuthProviderEmailInput, required: false
      end
  
      argument :name, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: false
  
      type Types::UserType
  
      def resolve(name: nil, auth_provider: nil)
        User.create!(
          name: name,
          email: auth_provider&.[](:email)&.[](:email),
          password_confirmation: auth_provider&.[](:email)&.[](:password),
          password: auth_provider&.[](:email)&.[](:passwordConfirmation)
        )
      end
    end
end