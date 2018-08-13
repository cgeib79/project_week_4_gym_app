require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/member')
require_relative('./models/fitness_class')
also_reload('.models/*')

get '/members' do #index
  @members = Member.all()
  erb( :index )
end

get '/members/new' do #new
  erb(:new)
end

get '/members/:id' do #show
  @member = Member.find( params[:id] )
  erb( :show )
end

post '/members' do #create
  @member = Member.new( params )
  @member.save()
  erb( :create )
end

get '/members/:id/edit' do #edit
  @member = Member.find( params[:id])
  erb( :edit )
end

post '/members/:id' do #update
  Member.new( params ).update
  redirect to '/members'
end

post '/members/:id/delete' do #delete
  member = Member.find( params[:id] )
  member.delete()
  redirect to '/members'
end

get '/fitness_classes' do #index_fitness_classes
  @fitness_classes = Fitness_Class.all()
  erb(:fitness_classes)
end
