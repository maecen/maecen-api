class CategoryValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    unless record.class.valid_categories.include? value
      record.errors.add(:category, 'is invalid')
    end
  end
end