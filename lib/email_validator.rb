#
# A really simple email validator
#
class EmailValidator < ActiveModel::EachValidator
  def self.valid?(email)
    email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid_email, :default => options[:message], :value => value) unless self.class.valid? value
  end
end
