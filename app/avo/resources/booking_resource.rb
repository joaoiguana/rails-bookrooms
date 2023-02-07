class BookingResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :room, as: :belongs_to
  field :user, as: :belongs_to, default: ->  { Avo::App.context[:current_user].id }, readonly: true
  field :booked_at, as: :date_time
  field :booked_for, as: :select, options: {
    '1 person': 1,
    '2 persons': 2,
    '4 persons': 4,
    '6 persons': 6,
  }
  # add fields here
end
