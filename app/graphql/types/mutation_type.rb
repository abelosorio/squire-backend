Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :create_work_entry, Types::WorkEntryType do
    name 'CreateWorkEntry'
    argument :work_entry, WorkEntryInputType
    resolve ->(object, input, ctx) {
      WorkEntry.create! input[:work_entry].to_h
    }
  end

  field :update_work_entry, Types::WorkEntryType do
    name 'UpdateWorkEntry'
    argument :id, !types.Int
    argument :work_entry, !WorkEntryInputType
    resolve ->(object, input, ctx) {
      WorkEntry.update input[:id], input[:work_entry].to_h
    }
  end

  field :delete_work_entry, types.Boolean do
    name 'DeleteWorkEntry'
    argument :id, !types.Int
    resolve ->(object, input, ctx) {
      not WorkEntry.delete(input[:id]).zero?
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
