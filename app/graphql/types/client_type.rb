Types::ClientType = GraphQL::ObjectType.define do
  name 'Client'
  field :id, !types.ID
  field :name, !types.String
end
