Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :create_work_entry, Types::WorkEntryType do
    name 'CreateWorkEntry'
    argument :work_entry, WorkEntryInputType
    resolve ->(object, input, ctx) {
      WorkEntry.create! input[:work_entry].to_h
    }
  end
end

WorkEntryInputType = GraphQL::InputObjectType.define do
  name 'WorkEntryInputType'

  argument :entry_date, !types.String
  argument :client, !types.String
  argument :project, !types.String
  argument :worked_hours, !types.Int
end