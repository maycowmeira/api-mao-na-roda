class Frequencia
  attr_accessor :start_period, :end_period, :type

  def initialize(freq_start, freq_end, type)
    define_periods(freq_start, freq_end)
    raise ArgumentError, 'Data inicial maior que a final!' unless start_period < end_period
    self.type = type
  end

  def frequencia
    timestamp = type.to_s == 'Problema' ? 'data_hora_reporte' : 'data_hora'
    frequencias = type.where("#{timestamp} >= ? AND #{timestamp} <= ?", start_period, end_period)
                      .group("(EXTRACT(YEAR FROM #{timestamp}))::integer")
                      .group("(EXTRACT(MONTH FROM #{timestamp}))::integer")
                      .order('2 ASC, 3 ASC')
                      .count
    map_years_and_months(frequencias)
  end

  def map_years_and_months(frequencias)
    start_year = start_period.year
    start_month = start_period.month
    last_year = end_period.year
    last_month = end_period.month
	  mapped_frequencies = []

    while start_year != last_year || start_month != last_month
      mapped_frequencies << {
        ano: start_year,
        mes: start_month,
        valor: frequencias[[start_year, start_month]] || 0
      }
      start_month = start_month == 12 ? 1 : start_month + 1
      start_year += 1 if start_month == 1
    end

    mapped_frequencies << { ano: last_year, mes: last_month, valor: frequencias[[last_year, last_month]] || 0 }
  end

  def define_periods(freq_start, freq_end)
    if freq_start.nil?
      self.start_period = DateTime.parse(Problema.minimum(:data_hora_reporte).to_s) || DateTime.parse('19710101')
    else
      self.start_period = DateTime.parse(freq_start).utc.beginning_of_month rescue DateTime.parse(Problema.minimum(:data_hora_reporte).to_s) || DateTime.parse('19710101')
    end

    if freq_end.nil?
    	self.end_period = Time.zone.now.end_of_month
    else
      self.end_period = DateTime.parse(freq_end).utc.end_of_month rescue Time.zone.now.end_of_month
    end
  end

  def get_year_from_frequency(date)
    date.to_s[1..4].to_i
  end

  def get_month_from_frequency(date)
    date.to_s[7..8].chomp(']').to_i
  end
end
