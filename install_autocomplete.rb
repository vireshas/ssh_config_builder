#!/usr/bin/ruby

## This script adds the autocomplete feature for the ssh bookmarks
#  This is meant for bash shell. zsh users should probably install ohmyzsh which has this feature.

home=`echo ~`.strip
autocomplete_cmd = "if [ -r ~/.ssh/config ]; then\ncomplete -W \"$(echo `if [ -r ~/.ssh/config ];then cat ~/.ssh/config; fi | grep Host | cut -f 2 -d ' ' | uniq`;)\" ssh\nfi"

#adding autocomplete to bashrc
if File.exists?("#{home}/.bashrc")
  File.open("#{home}/.bashrc", "a").puts autocomplete_cmd
elsif File.exists?("#{home}/.bash_profile")
  File.open("#{home}/.bash_profile", "a").puts autocomplete_cmd
end
