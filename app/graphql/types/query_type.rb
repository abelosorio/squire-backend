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
end
