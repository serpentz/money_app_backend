module Types
  class UserInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :email, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true
  end
end
