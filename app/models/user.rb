class User < MassiveRecord::ORM::Table
  #
  # References many cars means that the car records is stored
  # in another table and we are to reference them in our user
  # model.
  #
  # We give the option :store_in => :info which means that
  # an array of foreign keys will be persisted in the
  # column family info.
  #
  # When loading records from this type of association
  # MassiveRecord will call find() on Car one time per
  # record, which might have a bit overhead.. A better
  # solution is to do it the way we reference emails.
  #
  references_many :cars, :store_in => :info

  #
  # References many emails as well, but this time we do not
  # store the foreign keys inside of this user. Instead we
  # look emails up via a composite key. Emails will have keys
  # like "Person-<person_id>-<some_unique_id>". This is defined
  # in the emails_starts_from method. MassiveRecord will look up
  # emails starting with that id.
  #
  references_many :emails, :records_starts_from => :emails_starts_from


  column_family :info do
    field :name
  end


  validates_presence_of :name



  private

  #
  # Helper method which tells us which ids emails starts from
  # related to this user.
  #
  def emails_starts_from
    "#{self.class.to_s}-#{id}-"
  end

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
