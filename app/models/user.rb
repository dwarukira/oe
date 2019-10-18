class User
  include Neo4j::ActiveNode
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include Tokenizable

  

  property :name, type: String
  property :email, type: String
  property :phone, type: String

  property :encrypted_password, type: String
  property :jti, type: String

  ## Rememberable
  property :remember_created_at, type: DateTime
  index :remember_token

  ## Recoverable
  property :reset_password_token
  index :reset_password_token
  property :reset_password_sent_at, type: DateTime

  ## Trackable
  property :sign_in_count, type: Integer, default: 0
  property :current_sign_in_at, type: DateTime
  property :last_sign_in_at, type: DateTime
  property :current_sign_in_ip, type: String
  property :last_sign_in_ip, type: String

  property :created_at
  property :updated_at

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true



  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :devise,
         :validatable,
         :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_one :out, :seller, type: :HAS_SELLER
  

end
