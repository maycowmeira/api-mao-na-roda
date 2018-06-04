class Frequencia
  attr_accessor :start_period, :end_period, :type

  def initialize(mes_start, mes_end, ano_start, ano_end, type)
    define_periods(mes_start, mes_end, ano_start, ano_end)
    self.type = type
  end

  def frequencia
  	timestamp = type.to_s == "Problema" ? "data_hora_reporte" : "data_hora"
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
    while start_year != last_year || start_month != last_month do
      mapped_frequencies << {
        ano: start_year,
        mes: start_month,
        valor: frequencias[[start_year, start_month]] || 0
      }
      start_month = start_month == 12 ? 1 : start_month + 1
      start_year = start_year + 1 if start_month == 1
    end

    mapped_frequencies << {ano: last_year, mes: last_month, valor: frequencias[[last_year, last_month]] || 0}
  end

  def define_periods(mes_start, mes_end, ano_start, ano_end)
    if ano_start.nil? || mes_start.nil?
      self.start_period = DateTime.parse(Problema.minimum(:data_hora_reporte).to_s) || DateTime.parse('19710101')
    else
      self.start_period = DateTime.new(ano_start.to_i, mes_start.to_i, 1).utc
    end
    if ano_end.nil? || mes_end.nil?
      self.end_period = Time.zone.now.end_of_month
    else
      self.end_period = DateTime.new(ano_end.to_i, mes_end.to_i, 1).utc.end_of_month
    end
  end

  def get_year_from_frequency(date)
    date.to_s[1..4].to_i
  end

  def get_month_from_frequency(date)
    date.to_s[7..8].chomp(']').to_i
  end
end
