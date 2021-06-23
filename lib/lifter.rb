class Lifter
  attr_reader :name, :lift_total
  @@all = []
  @@total = 0

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all_lift_total += lift_total

    @@all << self
  end

  def self.all
    @@all
  end
  
  def memberships
    Membership.all.select{|membership| membership.lifter == self}
  end

  def gyms
    self.memberships.map{|membership| membership.gym}
  end

  def self.ave_lift_total
    @@all_lift_total / self.all.length
  end

  def total_cost
    total = 0
    self.memberships.each{|membership| total += membership.cost}
    total
  end

  def new_membership(gym, cost)
    Membership.new(cost, gym, self)
  end
end

