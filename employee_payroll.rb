require colorize
class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
    salary = @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, yearly_salary)
        @name = name
        @email = email
        @yearly_salary = yearly_salary
    end

    def calculate_salary
    	salary = @yearly_salary / 54
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, yearly_salary, hourly_rate, hours_worked)
        @name = name
        @email = email
        @yearly_salary = yearly_salary
		@hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
    	if @hours_worked > 40
    		salary = (@yearly_salary / 54) + ((@hours_worked-40)*@hourly_rate)
    	else
    		salary = @yearly_salary / 54
    	end
    end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end

	def pay_employees
	# Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
  		@employees.each do |employee|
  			puts "#{employee.name} => #{employee.calculate_salary}"
  		end
  		venture = employes.reduce(0){|sum,employee| sum + employee.calculate_salary}
  		puts "venture => #{venture}"
  	end
end