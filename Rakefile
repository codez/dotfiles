# frozen_string_literal: true

require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE vscode bundle].include?(file)

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end

  system 'mkdir -p $HOME/.config/Code/User'
  system 'rm -f $HOME/.config/Code/User/settings.json'
  system %(ln -s "$PWD/vscode/settings.json" "$HOME/.config/Code/User/settings.json")

  system 'mkdir -p $HOME/.bundle'
  system 'rm -f $HOME/.bundle/config'
  system %(ln -s "$PWD/bundle/config" "$HOME/.bundle/config")
end

def replace_file(file)
  system %(rm -rf "$HOME/.#{file.sub('.erb', '')}")
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %(ln -s "$PWD/#{file}" "$HOME/.#{file}")
  end
end
