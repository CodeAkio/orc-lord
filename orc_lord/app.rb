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
  when :gen_wl
    wl = Wordlist::Wordlist.new(View::wordlist_type, View::min_range, View::max_range)
    wl.gen_wl
  when :win_bfa
    View::select_file
  when :linux_bfa
    View::select_file
  when :mac_bfa
    View::select_file
  when :wifi_bfa
    View::select_file
  when :http_bfa
    View::select_file
  when :ftp_bfa
    View::select_file
  when :smtp_bfa
    View::select_file
  when :ssh_bfa
    View::select_file
  when :web_bfa
    View::select_file
  when :router_bfa
    View::select_file
end