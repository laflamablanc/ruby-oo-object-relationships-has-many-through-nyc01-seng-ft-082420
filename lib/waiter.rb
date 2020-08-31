class Waiter

  attr_accessor :name, :yrs_exp
  @@all = []

  def initialize(name, yrs_exp)
    @name = name
    @yrs_exp = yrs_exp
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tip = meals.max {|a,b| a.tip <=> b.tip}
    best_tip.customer
  end

end
