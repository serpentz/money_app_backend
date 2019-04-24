module Resolvers
    class CreateUser < GraphQL::Function
    # TODO: define return fields

    argument :user, Types::UserInputType


    type do
      name 'CreateUserPayload'

      field :user, Types::UserType
      field :errors, types.String
      field :token, types.String

    end

    # TODO: define resolve method
    def call(_obj, args, _ctx)

      @user = User.create args[:user].to_h

      # ensures we created the user
      unless @user.valid?
        return OpenStruct.new(
          errors: @user.errors.full_messages.join(', ')
        )
      end

      @token = _ctx[:encode_token_lam].call({user_id: @user.id})
      OpenStruct.new(
        user: @user,
        token: @token
      )
    end

  end
end
