module View

  def self.banner
    system('clear')
    
    File.open(File.expand_path('../../ascii/banner.txt', __FILE__), 'r') do |arq|
      while line = arq.gets
        print $pastel.green.bold(line)
      end
      puts "\n\n"
    end
  end

  
  def self.main_menu
    choices = ['Generate a new wordlist', 'Use a local txt file as wordlist']
    $prompt.select("You don't have any wordlist, what do you want to do?", choices)
  end


  def self.wordlist_type
    choices = {
              'Alpha - lower case' => 'alpha_low',
              'Alpha - upper case' => 'alpha_up',
              'Numeric' => 'num',
              'special characters' => 'special'
              }

    $prompt.multi_select("Choose what type of characteres your wordlist will use:", choices)
  end

  
  def self.min_range
    $prompt.ask("What's the initial range size for your wordlist?", convert: :int)
  end

  
  def self.max_range
    $prompt.ask("What's the max range size for your wordlist?", convert: :int)
  end

  
  def self.select_file  
    $prompt.ask("What's the name of your local wordlist file?", convert: :file)
  end

  
  class Bar

    def initialize(chars, min, max)
      @total_bar=0
      (Array min..max).each{ |i| @total_bar += chars ** i }
      @bar = TTY::ProgressBar.new( "|:bar|",
        total: @total_bar,
        complete: $pastel.on_blue(" "),
        incomplete: $pastel.on_red(" "),
        width: 100
      )
    end

    
    def update_bar
      @bar.current += 1
    end
  end

end