module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    
    field :me , Types::UserType,  null: true do
      description 'Returns the current user'
    end

    field :products, [Types::ProductType], null: false

    def test_field
      "Hello World!"
    end

    def me(demo: false)
      context[:current_user]
    end


    def products
     
      context[:current_user].seller.products
    end

    

  end
end
