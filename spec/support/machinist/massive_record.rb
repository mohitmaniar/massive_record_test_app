require 'machinist'

#
# Includes functionality in MassiveRecord so it's subclasses has
# the Machinist functionality.
#
# I guess this should be put out in a fork of Machinist or 
# our own machinist_massive_record gem or something,
# but right now I'm doing it quick and dirty.
#
class MassiveRecord::ORM::Base
  extend Machinist::Machinable

  def self.make!(*args)
    record = make(*args)
    record.save!
    record.reload
  end
end
