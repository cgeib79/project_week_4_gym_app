require_relative('../db/sql_runner')
require_relative('member')
require_relative('fitness_class')

class Member_Class

attr_reader :member_id, :fitness_class_id, :fitness_class_max_size, :all_members_in_fitness_class

attr_accessor :member_id, :fitness_class_id, :fitness_class_max_size, :all_members_in_fitness_class

def initialize( options )
  @id = options['id'].to_i if options['id']
  @member_id = options['member_id'].to_i
  @fitness_class_id = options['fitness_class_id'].to_i
  @fitness_class_max_size = options['fitness_class_max_class_size'].to_i
  @list_members_per_class = options['all_members_in_fitness_class']
end

def save()
  sql = 'INSERT INTO member_classes
(
  member_id,
  fitness_class_id,
  fitness_class_max_size,
  all_members_in_fitness_class
)
VALUES
(
  $1, $2, $3, $4
)
'
values = [@member_id, @fitness_class_id, @fitness_class_max_size, @list_members_per_class]
member_class = SqlRunner.run( sql, values ).first
@id = visit['id'].to_i
end

def member()
  sql = 'SELECT * FROM members WHERE id =$1'
  values = [@member_id]
  member = SqlRunner.run(sql, values).first
  return Member.new(member)
end

def fitness_class()
  sql = 'SELECT * FROM fitness_classes WHERE id =$1'
  values = [@fitness_class_id]
  fitness_class = SqlRunner.run(sql, values).first
  return Fitness_Class.new(fitness_class)
end

def self.all()
  sql = 'SELECT * FROM member_classes'
  member_class_data = SqlRunner.run(sql)
  return Member_Class.map_items(member_class_data)
end

def self.delete_all()
  sql = 'DELETE FROM member_classes'
  SqlRunner.run(sql)
end

def self.map_items(member_class_data)
  result = member_class_data.map{|member_class| Member_Class.new( member_class) }
  return result
end

end
