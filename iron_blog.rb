#Modulo para colorear
require 'colorize'

class Blog
	def initialize
		@blog = []
	end

	#Añade un post
	def add_post(post)
		@blog = @blog.unshift(post)
	end

	#Añade un post patrocinado
	def add_sponsored(post)
		post.title = "******#{post.title}******"
		@blog = @blog.unshift(post)
	end

	#Muestra todos los post
	def publish_front_page
		@blog.each do |post|
			puts "#{post.title}"
			puts "**************"
			puts "#{post.text}"
			puts "----------------"
		end
	end	

	#Muestra los post en regonico
	def publish_regonicly
		pagination(1)
	end	

	def pagination(page)
		system "clear"
		#Numero de post por pagina
		post_per_page = 3
		#Posicion de lectura y ajuste de numero de paginas
		position = (page - 1) * post_per_page
		large = (@blog.length-1)/post_per_page

		#Numero de veces que itera en funcion de la posicion
		#Se ajusta en caso de que haya menos a mostrar que el maximo
		if  large < page
			count = @blog.length - position
		else 
			count = post_per_page
		end 

		count.times {
			puts "#{@blog[position].title}".colorize(:blue)
			puts "**************".colorize(:grey)
			puts "#{@blog[position].text}"
			puts "----------------".colorize(:grey)
			position +=1
		}

		#Imprime la posicion de paginacion
		i = 1
		while i <= large +1
			if i == page
				print "#{i}  ".colorize(:red)
			else
				print "#{i}  ".colorize(:light_blue)
			end
			i +=1
		end

		#Recibe la accion a hacer
		action = gets.chomp

		#En caso de estar en los extremos, o no recibir orden correcta
		#se mantiene en la pagina
		if action == "next"
			if page <= large
				page += 1
			end
			pagination(page)
		elsif action == "prev"
			if page != 1
				page -= 1
			end
			pagination(page)
		elsif action == "exit"
			exit
		else
			pagination(page)
		end
	end
end

class Post
	attr_reader :date, :text
	attr_accessor :title
	def initialize(title, text)
		@title = title
		@date = Time.now.strftime "%Y-%m-%d %H:%M:%S %z"
		@text = text
	end
end

blog = Blog.new
blog.add_post Post.new("post1","texto1texto1texto1texto1texto1") 
blog.add_post Post.new("post2","texto2texto1texto1texto1") 
blog.add_post Post.new("post3","texto3texto1") 
blog.add_post Post.new("post4","texto4texto1texto1texto1texto0") 
blog.add_sponsored Post.new("post5","texto5texto1texto1texto1texto1texto1") 
blog.add_post Post.new("post6","texto2texto1texto1texto1texto0") 
blog.add_post Post.new("post7","texto3texto1") 
blog.add_sponsored Post.new("post8","texto5texto1texto1texto1") 
blog.add_post Post.new("post9","texto4texto1texto1texto1texto1")
blog.add_sponsored Post.new("post10","texto5texto1texto1texto1texto1texto1") 
blog.add_sponsored Post.new("post11","texto5texto1texto1texto1") 

#blog.publish_front_page

blog.publish_regonicly