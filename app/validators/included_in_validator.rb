class IncludedInValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    method_name = 'valid_' + attribute.to_s.pluralize

    unless record.class.send(method_name).include? value
      record.errors.add(attribute, "can't be #{value}")
    end
  end
end