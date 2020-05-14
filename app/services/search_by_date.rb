class SearchByDate
  def initialize(query:)
    @query = query
  end

  def call
    parse_query_to_number_date
  rescue
    { error: 'Not valid date please use like this: May 14 2020' }
  end

  private

  attr_reader :query

  def parse_query_to_number_date
    array_of_values = query.split(' ')
    raise :error unless array_of_values.size == 3

    check_day_month_year(array_of_values: array_of_values).values.join('.')
  end

  def check_day_month_year(array_of_values:)
    array_of_values.each_with_object(day: nil, month: nil, year: nil) do |date_value, date|
      date_value = Integer(date_value).to_s
      if date_value.size > 2
        date[:year] = date_value
      elsif [1,2].include?(date_value.size)
        date[:day] = date_value
      else
        raise :error
      end
    rescue ArgumentError
      month = Date::MONTHNAMES.index(date_value.capitalize)
      raise :error unless month

      date[:month] = month.to_s
    end
  end
end
