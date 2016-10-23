require 'imdb'

class File
	#Clase file, que lee las líneas del fichero
	def self.read_file(file)
		@fichero = IO.readlines(file)
	end
end

class Web
	#Clase web, hace la búsqueda de la puntuación de la película
	def self.search_rating (film)
		Imdb::Search.new(film).movies[0].rating
	end
end

class Film_rating
	def self.start
		#Inicia el programa; lee el fichero de texto
		file = File.read_file("movies.txt")
		#Genera array de películas y valoración
		list = list_film(file)
		
		Printer.print_poll(list)
	end

	def self.list_film(file)
		#Genera un array que contiene el nombre de la película y la valoración encontrada
		list = []
		file.each do |film|
			list << [film.chomp,Web.search_rating(film)]
		end
		return list
	end
end

class Printer
	def self.print_value_per_range(list, range)
		#Imprime por línea de valoración y rango
		print "|"
		list.each do |value|
			if value < range
				print " |"
			else
				print "#|"
			end
		end
	end

	def self.print_all_values(list)
		#Imprime todas las líneas para cada rango
		max = list.max.round
		while max >= 0 
			print_value_per_range(list,max)
			print "\n"
			max -= 1
		end

		number = list.length

		#Imprime la línea de separación
		print "-"
		number.times {print "--"}
		print "\n"

		#Imprime las cuadrículas con los números
		count = 1
		print "|"
		while count <= number
			print "#{count}|"
			count += 1
		end
		print "\n"
	end

	def self.print_films(list)
		#Imprime las películas con su número
		count = 1
		list.each do |film|
			puts "#{count}. #{film}"
			count += 1
		end
	end

	def self.print_poll(list)
		#Genera listas de películas y puntuaciones
		values = [] 
		films = []
		list.each do |name,rate|
			films << name
			values << rate
		end
		
		#Llama a las funciones de imprimir puntuaciones y nombres de peliculas
		print_all_values(values)
		print_films(films)

	end
end

Film_rating.start

