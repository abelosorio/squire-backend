Types::WorkEntryType = GraphQL::ObjectType.define do
  name 'WorkEntry'
  field :id, !types.ID
  field :entry_date, types.String
  field :client, types.String
  field :project, types.String
  field :worked_hours, types.Int
end
