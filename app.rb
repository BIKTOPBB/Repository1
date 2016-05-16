require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error="something!!!!"
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
   	@email=params[:email]
	@mess=params[:mess]
	@message="Thank you, your qweshon is saved"
	f = File.open "./public/email.txt", "a"
	f.write "Email:\n#{@email}\nMessage:\n#{@mess}\n"
	f.close
	erb :message
end


get '/login' do
	erb :login
end
post '/' do
   	@name = params[:username]
	@pass = params[:password]
	@message = ""
	erb :login
	if @name=="admin"&&@pass=="qwe"
		erb :welcom
	else
		@message="acces denaed"
		erb :login	
	end
end

post '/visit' do
   	@name1 = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@par = params[:par]
	@color = params[:color]
	
	if @name1==''
		@error="Введите имя!"
		return erb :visit
	end
	if @phone==''
		@error="Введите телефон!"
		return erb :visit
	end
	if @datetime==''
		@error="Введите дату и время!"
		return erb :visit
	end
	if @par==''
		@error="Выберите парикмахера!"
		return erb :visit
	end

#	@title = "Thank you!"
#	@message = "Dear #{@name1}(#{@phone}), we'll be waiting for you at #{@datetime}. Your barber is #{@par}. Ваш цвет: #{@color}"
   	f = File.open "./public/data.txt", "a"
	f.write "User: #{@name1}, Phone: #{@phone}, Date and time: #{@datetime}. Par...:#{@par}\n"
	f.close

   	erb "Dear #{@name1}(#{@phone}), we'll be waiting for you at #{@datetime}. Your barber is #{@par}. Ваш цвет: #{@color}"
	
	
#        erb :message
	
end


