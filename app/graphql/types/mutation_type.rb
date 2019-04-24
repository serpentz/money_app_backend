module Types
  class MutationType < Types::BaseObject

    field :createUser, function: Resolvers::CreateUser.new

  end
end
