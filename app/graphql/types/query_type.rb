Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :work_entry do
    description 'Find a WorkEntry by ID'
    type Types::WorkEntryType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      WorkEntry.find args['id']
    }
  end

  field :work_entries do
    description 'Find all WorkEntries'
    type Types::WorkEntryType.to_list_type
    resolve -> (obj, args, ctx) {
      WorkEntry.all
    }
  end

  field :client do
    description 'Find a Client by ID'
    type Types::ClientType
    argument :id, !types.ID
    resolve ->(obj, args, ctx) {
      Client.find args['id']
    }
  end

  field :clients do
    description 'Find all the Clients'
    type Types::ClientType.to_list_type
    resolve ->(obj, args, ctx) {
      Client.all
    }
  end
end
