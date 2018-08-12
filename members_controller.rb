require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/member')
require_relative('./models/fitness_class')
also_reload('.models/*')

get '/members' do
  @members = Member.all
  erb :members
end

get '/members/new' do
  @fitness_classes = Fitness_Class.all
  erb (:new)
end

post 'members/new' do
  @members = Member.new(params)
  @members.save()
  redirect('/members')
end

get '/fitness_classes' do
  @fitness_classes = Fitness_Class.all()
  erb(:fitness_classes)
end
