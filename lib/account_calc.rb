class AccountCalc

  def initialize(line)
    @line = line
  end

  def return_line_balance(name)
    if @line[1] == name
      sum = -BigDecimal(@line[3])
    elsif @line[2] == name
      sum = BigDecimal(@line[3])
    end
    sum ||= 0
  end

  def return_line_name_count(name)
    if @line[1] == name
      name_count = 1
    elsif @line[2] == name
      name_count = 1
    end
    name_count ||= 0
  end

end
