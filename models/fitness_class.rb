require_relative('../db/sql_runner')

class Fitness_Class

  attr_accessor :class_name, :class_time, :peak_category, :max_class_size

  def initialize(options)
    @id = options['id'].to_i
    @class_name = options['class_name']
    @class_time = options['class_time'] #does time need .to_i?
    @peak_category = options['peak_category']
    @max_class_size = options['max_class_size'].to_i
  end

  def save()
    sql = 'INSERT INTO fitness_classes (class_name, class_time, peak_category, max_class_size) VALUES ($1, $2, $3, $4) RETURNING id'
    values = [@class_name, @class_time, @peak_category, @max_class_size]
    @id = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM fitness_classes'
    classes = SqlRunner.run(sql)
    classes.map {|fitness_class| Fitness_Class.new(fitness_class)}
  end

  def self.find(id)
    sql = 'SELECT * FROM fitness_classes WHERE id =$1'
    values =[id]
    classes = SqlRunner.run(sql, values)
    result = Fitness_Class.new(fitness_classes.first)
    return result
  end

end
