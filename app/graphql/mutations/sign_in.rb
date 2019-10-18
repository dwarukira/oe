module Mutations
    class SignIn < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class InputSignInData < Types::BaseInputObject
        argument :email, String, required: false
        argument :password, String, required: false
      end
  
      argument :input, InputSignInData, required: false
  
      type Types::UserAuthType
  
      def resolve(input: nil)
        user = User.find_for_authentication(email: input.email)
        return nil if !user

        is_valid_for_auth = user.valid_for_authentication?{
            user.valid_password?(input.password)
        }
        return is_valid_for_auth ? user : nil
      end
    end
end