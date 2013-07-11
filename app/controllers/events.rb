get '/event/create/new' do
  erb :create_event
end

post '/event/new/create' do
  @user = User.find(session[:user_id])
  
  event = Event.new(params[:event])
  event.update_attributes(:user_id => 6)

  redirect '/'
end

get '/event/find/:name' do
  @event = Event.find_by_name(params[:name])
  user_id = @event.user_id
  @user = User.find(user_id)
  erb :show_event
end