module Mutations
    class CreateProduct < BaseMutation
        class ProductInputType < Types::BaseInputObject
            argument :name, String, required: true
            argument :status, String, required: true
            argument :slug, String, required: false
            argument :description, String, required: false
            argument :unit_price, Float, required: true
            argument :unit_stock, String, required: true
            argument :brand , String, required: true
            argument :price, Float, required: true
            argument :sku, String, required: true
            
        end


        argument :input, ProductInputType, required: false

        type Types::ProductType

        def resolve(input: nil)
            # TODO validation for current user
            Product.create!(
                name: input.name,
                status: input.status,
                slug: input.slug,
                description: input.description,
                unit_price: input.unit_price,
                unit_stock: input.unit_stock,
                price: input.price,
                sku: input.sku,
                seller: context[:current_user].seller

            )
           


        end

    end

end


