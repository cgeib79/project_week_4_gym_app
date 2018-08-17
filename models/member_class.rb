require_relative('../db/sql_runner')
require_relative('member')
require_relative('fitness_class')

class Member_Class

  attr_reader :member_id, :fitness_class_id, :id

  attr_accessor :member_id, :fitness_class_id, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @fitness_class_id = options['fitness_class_id'].to_i
  end


  def id()
    return "#{@id}"
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

  def save()
    sql = 'INSERT INTO member_classes
    (
      member_id,
      fitness_class_id
    )
    VALUES
    (
      $1, $2
      ) RETURNING id
      '
      values = [@member_id, @fitness_class_id]
      member_class_data = SqlRunner.run( sql, values )
      @id = member_class_data.first()['id'].to_i
    end

    def update()
      sql = 'UPDATE member_classes
      SET
      (
        member_id,
        fitness_class_id
      )
      =
      (
        $1, $2
      )
      WHERE id = $3'
      values =[@member_id, @fitness_class_id]
      SqlRunner.run( sql, values)
    end

    def self.all()
      sql ='SELECT * FROM member_classes'
      member_classes = SqlRunner.run(sql)
      member_classes.map {|member_class| Member_Class.new(member_class)}
    end


    def self.find(id)
      sql = 'SELECT * FROM member_classes WHERE id=$1'
      values =[id]
      member_classes = SqlRunner.run(sql, values)
      result = Member_Class.new(member_classes.first)
      return result
    end

  end
