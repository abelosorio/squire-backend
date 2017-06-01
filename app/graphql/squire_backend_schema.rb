CreateWorkEntryMutation = GraphQL::Relay::Mutation.define do
  name 'CreateWorkEntry'

  input_field :entry_date, !types.String
  input_field :client, !types.String
  input_field :project, !types.String
  input_field :worked_hours, !types.Int

  return_type Types::WorkEntryType

  resolve ->(object, input, ctx) {
    WorkEntry.create!(
      client: input[:client],
      entry_date: input[:entry_date],
      project: input[:project],
      worked_hours: input[:worked_hours]
    )
  }
end

MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :create_work_entry, field: CreateWorkEntryMutation.field
end

SquireBackendSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  mutation(MutationType)
end
