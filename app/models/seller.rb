class Seller 
  include Neo4j::ActiveNode
  

  property :business_name, type: String
  property :phone, type: String
  property :display_name, type: String
  property :website, type: String
  property :bank_name, type: String
  property :bank_location, type: String
  property :bank_account_holders_name, type: String
  property :bank_account_number, type: String
  property :registered_for_vat, type: String
  property :vat_registration_number, type: String
  property :kra_pin, type: String
  property :description, type: String


  include Neo4j::Timestamps # will give model created_at and updated_at timestamps
  include Neo4j::Timestamps::Created # will give model created_at timestamp
  include Neo4j::Timestamps::Updated # will give model updated_at timest


  has_many :in, :products, origin: :seller
  has_one  :in, :user, type: :HAS_SELLER

  has_many :out, :users, type: :MANAGES_SELLER



end
