module View

  def self.banner
    system('clear')
    
    pastel = Pastel.new
    
    File.open(File.expand_path('../../ascii/banner.txt', __FILE__), 'r') do |arq|
      while line = arq.gets
        print pastel.green.bold(line)
      end
      puts "\n\n"
    end
  end
  
  def self.main_menu
    pastel = Pastel.new
    prompt = TTY::Prompt.new
    
    choices = ['Generate a new wordlist', 'Use a local txt file as wordlist']
    prompt.select("You don't have any wordlist, what do you want to do?", choices)
  end
  
  def self.wordlist_type
    pastel = Pastel.new
    prompt = TTY::Prompt.new
    
    choices = ['Alpha', 'Numeric', 'Alphanumeric', 'Alphanumeric and special characters']
    prompt.select("Choose what type of characteres your wordlist will use:", choices)
  end
  
  def self.min_range
    pastel = Pastel.new
    prompt = TTY::Prompt.new
    
    prompt.ask("What's the initial range size for your wordlist?", convert: :int)
  end
  
  def self.max_range
    pastel = Pastel.new
    prompt = TTY::Prompt.new
    
    prompt.ask("What's the max range size for your wordlist?", convert: :int)
  end
  
  def self.select_file
    pastel = Pastel.new
    prompt = TTY::Prompt.new
    
    prompt.ask("What's the name of your local wordlist file?", convert: :file)
  end
  
  def self.total_progress(chars, min, max)
    total=0
    
    for i in (min..max)
      total += chars ** i
    end
  end
  
end