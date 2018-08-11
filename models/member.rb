require_relative('../db/sql_runner')

class Member
  attr_accessor :first_name, :second_name, :membership_tier

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @membership_tier = options['membership_tier']
  end

  def save()
    sql = 'INSERT INTO members (first_name, second_name, membership_tier) VALUES ($1, $2, $3) RETURNING id']
    values = [@first_name, @second_name, @membership_tier]
    @id =SqlRunner.run(sql, values)
  end

  def self.find()
    sql = 'SELECT * FROM members'
    members = SqlRunner.run(sql)
    members.map{|map| Student.new(student)}
  end

  def
    sql = 'SELECT * FROM students WHERE id =$1'
    values = [id]
    students = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

end
