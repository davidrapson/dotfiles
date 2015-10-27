def header(message)
  puts "\n"
  puts "=================================================|\n"
  puts " #{message}"
  puts "=================================================|\n"
  puts "\n"
end

def sync_file( file, prefix, options = {} )
  options[:dry_run] ||= false
  options[:copy] ||= false

  name = File.basename(file)
  source = File.join(File.dirname(__FILE__), file)
  target = File.expand_path("#{prefix}#{name}")
  sync_method = ( options[:copy] ) ? 'copy' : 'symlink'

  if !options[:dry_run]
    rm target if File.exists?(target)
    if options[:copy]
      cp_r source, target, { :preserve => true }
    else
      ln_s source, target
    end
  else
    puts "Will #{sync_method} #{name} => #{prefix}#{name}"
  end
end

def relative_symlink( path, target )
  source = File.join(File.dirname(__FILE__), path)
  rm target if File.exists?(target)
  ln_s source, target
end

task :dotfiles do
  header "Symlinking dotfiles…"
  dotfiles = Dir["dots/*"]
  dotfiles.each do |file|
    sync_file file, "#{Dir.home}/."
  end
end

task :pure do
  header "Installing Pure prompt"
  zfunctions = File.expand_path("/usr/local/share/zsh/site-functions/")
  relative_symlink "pure/pure.zsh", File.join(zfunctions, "prompt_pure_setup")
  relative_symlink "pure/async.zsh", File.join(zfunctions, "async")
end

task :sublime do
    header "Syncing Sublime Text settings"
    source = File.expand_path("#{Dir.home}/Library/Application Support/Sublime Text 3/Packages/User")
    target = File.join(File.dirname(__FILE__), "sublime")
    cp_r source, target, { :preserve => true }
end

task :default => [ :dotfiles, :pure ] do
  puts "\nAll Done."
end
