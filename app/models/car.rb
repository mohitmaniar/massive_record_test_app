class Car < MassiveRecord::ORM::Table
  column_family :info do
    field :brand
    field :color
  end



  private

  #
  # default_id will be called if id is nil when you ask for it.
  #
  # Calling next_id will ask MassiveRecord's IdFactory for the
  # next id for the class it's being called on.
  #
  def default_id
    next_id
  end
end
