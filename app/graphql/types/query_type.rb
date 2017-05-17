Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :workEntry do
    description 'Find a WorkEntry by ID'
    type Types::WorkEntryType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      WorkEntry.find args['id']
    }
  end
end
