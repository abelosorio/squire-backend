CreateWorkEntryMutation = GraphQL::Relay::Mutation.define do
  name 'CreateWorkEntry'

  input_field :entry_date, !types.Date
  input_field :client, !types.String
  input_field :project, !types.String
  input_field :worked_hours, !type.Number

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
