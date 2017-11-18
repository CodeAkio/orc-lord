require 'net/smtp'
require 'net/ftp'

require 'pastel'
require 'tty-prompt'
require 'tty-progressbar'

require_relative 'lib/view'
require_relative 'lib/wordlist'

$pastel = Pastel.new
$prompt = TTY::Prompt.new

View::banner
opt = View::main_menu

case opt
  when 'Generate a new wordlist'
    wl = Wordlist::Wordlist.new(View::wordlist_type, View::min_range, View::max_range)
    wl.gen_wl
  when 'Use a local txt file as wordlist'
    View::select_file
end