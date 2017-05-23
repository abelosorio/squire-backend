CreateWorkEntryMutation = GraphQL::Relay::Mutation.define do
  name 'CreateWorkEntry'

  input_field :entry_date, !types.String
  input_field :client, !types.String
  input_field :project, !types.String
  input_field :worked_hours, !types.Int

  return_field :work_entry, Types::WorkEntryType

  resolve ->(object, inputs, ctx) {
    response = {
      work_entry: WorkEntry.create!(
        entry_date: inputs[:entry_date],
        client: inputs[:client],
        project: inputs[:project],
        worked_hours: inputs[:worked_hours]
      )
    }
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
