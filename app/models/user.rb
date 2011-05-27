class User < MassiveRecord::ORM::Table
  column_family :info do
    field :name
  end

  validates_presence_of :name
end
