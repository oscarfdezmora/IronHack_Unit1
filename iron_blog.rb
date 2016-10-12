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
		@blog << post
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
		post_per_page = 3
		position = (page - 1) * post_per_page

		if @blog.length/post_per_page < page
			count = @blog.length - position
		else 
			count = post_per_page
		end 

		count.times {
			puts "#{@blog[position].title}"
			puts "**************"
			puts "#{@blog[position].text}"
			puts "----------------"

			position +=1
		}

		

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