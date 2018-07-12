class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(arguments)
    arguments.each{|key, value| self.send(("#{key}="), value) }
  end

  def self.save(name, type, db)
    result = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name,type])
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).first
    attributes = {:id => result[0], :name => result[1], :type => result[2]}
    self.new(attributes)
  end
end
