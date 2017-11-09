require 'pastel'
require 'tty-prompt'
require_relative 'lib/view'
require_relative 'lib/wordlist'

View::banner
opt = View::main_menu

case opt
  when 'Generate a new wordlist'
    wl = Wordlist::Wordlist.new(View::wordlist_type, View::min_range, View::max_range)
    wl.gen_wl
  when 'Use a local txt file as wordlist'
    View::select_file
end