require 'email_validator'

class Email < MassiveRecord::ORM::Table
  #
  # References one 
  #
  references_one :owner, :polymorphic => true, :store_in => :info

  column_family :info do
    field :address
  end

  validates :address, :email => true



  private

  def default_id
    raise "Must have an owner set" if owner.nil?

    [owner_type, owner_id, next_id].join('-')
  end
end
