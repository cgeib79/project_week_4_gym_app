require_relative('../db/sql_runner')

class Fitness_Class

  attr_reader :fitness_class_name, :fitness_class_time, :peak_category, :fitness_class_max_size, :id

  attr_accessor :fitness_class_name, :fitness_class_time, :peak_category, :fitness_class_max_size, :id

  def initialize(options)
    @id = options['id'].to_i
    @fitness_class_name = options['fitness_class_name']
    @fitness_class_time = options['fitness_class_time']
    @peak_category = options['peak_category']
    @fitness_class_max_size = options['fitness_class_max_size'].to_i
  end

def id()
  return "#{@id}"
end

def fitness_class_name()
  return "#{@fitness_class_name}"
end

def fitness_class_time()
  return "#{@fitness_class_time}"
end

def peak_category()
  return "#{@peak_category}"
end

def fitness_class_max_size()
  return "#{@fitness_class_max_size}"
end

def full_fitness_class()
  return"#{@fitness_class_name} #{@fitness_class_time} #{@peak_category} #{@fitness_class_max_class_size}"
end

  def save()
    sql = 'INSERT INTO fitness_classes (fitness_class_name, fitness_class_time, peak_category, fitness_class_max_size) VALUES ($1, $2, $3, $4) RETURNING id'
    values = [@fitness_class_name, @fitness_class_time, @peak_category, @fitness_class_max_size]
    @id = SqlRunner.run(sql, values)
  end

def update()
  sql = 'UPDATE fitness_classes
  SET
  (
    fitness_class_name,
    fitness_class_time,
    peak_category,
    fitness_class_max_size
    )
    =
    (
      $1, $2, $3, $4
      )
      WHERE id = $5'
      values =[@fitness_class_name, @fitness_class_time, @peak_category, @fitness_class_max_size, @id]
      SqlRunner.run( sql, values)
end

def delete()
  sql = 'DELETE FROM fitness_classes WHERE id =$1'
  values = [@id]
  SqlRunner.run(sql, values)
end

  def self.all()
    sql = 'SELECT * FROM fitness_classes'
    classes = SqlRunner.run(sql)
    classes.map {|fitness_class| Fitness_Class.new(fitness_class)}
  end

  def self.find(id)
    sql = 'SELECT * FROM fitness_classes WHERE id =$1'
    values =[id]
    fitness_classes = SqlRunner.run(sql, values)
    result = Fitness_Class.new(fitness_classes.first)
    return result
  end

end
