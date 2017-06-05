class Employee
  attr_reader :salary
  def initialize(name, title, boss, salary)
    @name = name
    @title = title
    @boss = boss
    @salary = salary
  end

  def bonus(mutiplier)
    @salary * mutiplier
  end
end

class Manager < Employee
  def initialize(name, title, boss, salary)
    super
    @employees = []
  end

  def bonus(multiplier)
    total_bonus = []
    @employees.each do |employee|
      total_bonus << employee.salary
    end
    total_bonus.reduce(:+) * multiplier
  end

  def add_employee(name)
    @employees << name
  end
end

ned = Manager.new("Ned", "Founder", nil, 1000000)
darren = Manager.new("Darren", "TA Manager", "Ned", 78000)
shawna = Employee.new("Shawna", "TA", "Darren", 12000)
david = Employee.new("David", "TA", "Darren", 10000)

darren.add_employee(shawna)
darren.add_employee(david)
ned.add_employee(darren)
ned.add_employee(shawna)
ned.add_employee(david)
p darren.bonus(4)
p david.bonus(3)
p ned.bonus(5)
