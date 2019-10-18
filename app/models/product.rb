class Product 
  include Neo4j::ActiveNode
  property :name, type: String
  property :status, type: String
  property :slug, type: String # TODO create emun
  property :description, type: String
  property :unit_price, type: Float
  property :unit_stock, type: Integer
  property :brand, type: String
  property :price, type: Float
  property :sku, type: String


  has_one :out, :seller, type: :SOLD_BY


  include Neo4j::Timestamps # will give model created_at and updated_at timestamps
  include Neo4j::Timestamps::Created # will give model created_at timestamp
  include Neo4j::Timestamps::Updated # will give model updated_at timest


end
