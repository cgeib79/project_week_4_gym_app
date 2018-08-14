require_relative('../db/sql_runner')

class Member

  attr_reader :first_name, :second_name, :membership_tier, :id

  attr_accessor :first_name, :second_name, :membership_tier, :id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @membership_tier = options['membership_tier']
  end

  def id()
    return "#{@id}"
  end

def first_name()
  return "#{@first_name}"
end

def second_name()
  return "#{@second_name}"
end

def membership_tier()
  return "#{@membership_tier}"
end

def full_name()
  return "#{@first_name} #{@second_name}"
end

  def save()
    sql = 'INSERT INTO members
    (
      first_name, second_name, membership_tier
    )
       VALUES (
         $1, $2, $3
         )
         RETURNING *'
    values = [@first_name, @second_name, @membership_tier]
    member_data = SqlRunner.run(sql, values)
    @id = member_data.first()['id'].to_i
  end

def update()
  sql = 'UPDATE members
  SET
(
  first_name,
  second_name,
  membership_tier
) =
(
  $1, $2, $3
)
WHERE id = $4'
values =[@first_name, @second_name, @membership_tier, @id]
SqlRunner.run( sql, values)
end

  def delete()
    sql = 'DELETE FROM members WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = 'SELECT * FROM members'
    members = SqlRunner.run(sql)
    members.map {|member| Member.new(member)}
  end

  def self.find(id)
    sql = 'SELECT * FROM members WHERE id =$1'
    values = [id]
    members = SqlRunner.run(sql, values)
    result = Member.new(members.first)
    return result
  end



end
