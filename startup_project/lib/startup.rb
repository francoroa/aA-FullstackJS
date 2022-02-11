require "employee"

class Startup
    attr_reader :name, :salaries
    attr_accessor :funding, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include? title
    end
    
    def >(other_startup)
        if self.funding > other_startup.funding
            return true
        else 
            return false
        end
    end

    def hire(employee_name, title)
        if valid_title? title
            @employees << Employee.new(employee_name, title)
        else
            raise "Invalid title."
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "No money."
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        return sum * 1.0 / @employees.length
 
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @salaries.merge!(other_startup.salaries) { |key, v1, v2| v1 }
        @employees += other_startup.employees
        other_startup.close
    end

end
