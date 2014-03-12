class InTheFutureValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value == nil
      record.errors[:attribute] << (options[:message] || 'please enter a date')
    elsif value < DateTime.now
      record.errors[:attribute] << (options[:message] || 'must be a future date/time')
    end
  end
end