require_relative 'employee'

class Manager < Employee

  def initialize(name, title, salary, boss, employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)

    bonus = (employee_salaries) * multiplier
  end

  def employee_salaries
    total = 0
    @employees.each do |employee|
      if employee.class == Employee
        total += employee.salary
      else
        total += employee.salary
        total += employee.employee_salaries
      end
    end
    total
  end


end
