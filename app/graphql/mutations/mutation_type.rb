MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :create_work_entry, field: CreateWorkEntryMutation.field
end
