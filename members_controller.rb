require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/member')
require_relative('./models/fitness_class')
require_relative('./models/member_class')
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
  erb(:index_fitness_classes)
end

get '/fitness_classes/new' do #new_fitness_classes
  erb(:new_fitness_classes)
end

get '/fitness_classes/:id' do #show_fitness_classes
  @fitness_class = Fitness_Class.find( params[:id] )
  erb(:show_fitness_classes)
end

post '/fitness_classes' do #create_fitness_classes
  @fitness_class = Fitness_Class.new( params )
  @fitness_class.save()
  erb( :create_fitness_classes)
end

get '/fitness_classes/:id/edit' do #edit_fitness_classes
  @fitness_class = Fitness_Class.find( params[:id])
  erb( :edit_fitness_classes )
end

post '/fitness_classes/:id' do #update_fitness_classes
  Fitness_Class.new( params ).update
  redirect to '/fitness_classes'
end

post '/fitness_classes/:id/delete' do #delete_fitness_classes
  fitness_class = Fitness_Class.find( params[:id] )
  fitness_class.delete()
  redirect to '/fitness_classes'
end

get '/member_classes' do #index_member_classes
  @member_classes = Member_Class.all()
  erb( :index_member_classes)
end

get '/member_classes/new' do #new_member_classes
  erb(:new_member_classes)
end

get '/member_classes/:id' do #show_member_classes
  @member_class = Member_Class.find( params[:id] )
  erb(:show_member_classes)
end

post '/member_classes' do
  #create_new_entries_member_classes
  @member_class = Member_Class.new( params)
  @member_class.save()
  erb( :create_member_classes)
end

get '/member_classes/:id/edit' do #edit_member_classes
  @member_class = Member_Class.find( params[:id] )
  erb( :edit_member_classes)
end

post '/member_classes/:id' do
  #update_ member_classes
  Member_Class.new( params ).update
  redirect to '/member_classes'
end

post '/member_classes/:id/delete' do
  #delete_member_classes
  member_class = Member_Class.find( params[:id])
  member_class.delete()
  redirect to '/member_classes'
end
