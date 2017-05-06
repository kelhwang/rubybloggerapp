class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "passwords should match", if: :password
  
end
