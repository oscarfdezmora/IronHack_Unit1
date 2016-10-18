class Program
	private
	def self.login? us,pw
		@@user = "oscar"
		@@password = "123456" 
		us == @@user && pw == @@password
	end

	def self.get_user
		print "User: "
		gets.chomp
	end

	def self.get_password
		print "Password: "
		gets.chomp
	end

	def self.start
		user=get_user
		password=get_password
		if login?(user,password)
			puts "User logged"
			Functions.start
		else puts "Login error"
		end
	end
end

class Functions

	def self.count_words phrase
		puts phrase.split(" ").count
	end

	def self.count_letters phrase
		count = 0
		phrase.split(" ").each do |word|
			count += word.length
		end
		puts count
	end

	def self.reverse_phrase phrase
		puts phrase.reverse
	end

	def self.upcase_phrase phrase
		puts phrase.upcase
	end

	def self.downcase_phrase phrase
		puts phrase.downcase
	end

	def self.show_options
		puts "What you wanna do?"
		puts "1 - Count words"
		puts "2 - Count letters"
		puts "3 - Reverse"
		puts "4 - Upcase"
		puts "5 - Downcase"
	end

	def self.select_option
		print ">"
		gets.chomp
	end

	def self.get_phrase
		puts "Put phrase"
		gets.chomp
	end

	def self.start
		@phrase = get_phrase
		show_options
		option = select_option
		case option
		when "1"
			count_words @phrase
		when "2"
			count_letters @phrase
		when "3"
			reverse_phrase @phrase
		when "4"
			upcase_phrase @phrase
		when "5"
			downcase_phrase @phrase
		when "quit"
			exit
		else 
			puts "Wrong selection"
			select_option
		end
	end

end


Program.start