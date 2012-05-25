# Rakefile
# ===============================================

# Config
# ===============================================

dots       = Dir["dots/*"]
scripts    = Dir["scripts/*"]
zsh_themes = Dir["zsh/themes/*"]
zsh_custom = "zsh/custom"


# Helpers
# ===============================================

def header(message)
  puts "\n***************************************************\n"
  puts "* #{message}"
  puts "***************************************************\n\n"
end

def sync_file( file, prefix, options = {} )

  options[:dry_run] ||= false
  options[:copy] ||= false

  path   = File.join(File.dirname(__FILE__), file)
  name   = File.basename(file)
  target = File.expand_path("#{prefix}#{name}")

  if options[:copy]
    if !options[:dry_run]
      rm_rf target if File.exists?(target)
      cp_r path, target, { :preserve => true }
    else
      puts "Will copy #{path} => #{target}"
    end
  else
    if !options[:dry_run]
      rm_rf target if File.exists?(target)
      ln_s path, target
    else
      puts "Will symlink #{path} => #{target}"
    end
  end

end


# Dotfiles
# ===============================================

task :dots do

  header "Copying dotfiles..."
  dots.each do |file|
    sync_file file, "~/."
  end

end


# Scripts
# ===============================================

task :scripts do

  header "Copying script files..."
  scripts.each do |file|
    sync_file file, "~/Developer/scripts/", { :copy => true }
  end

end


# Oh My ZSH
# ===============================================

task :zsh =>  [ "zsh:custom", "zsh:themes" ]
namespace :zsh do

  task :custom do
    header "Symlinking zsh custom directory..."
    sync_file zsh_custom, "~/.oh-my-zsh/"
  end

  task :themes do
    header "Symlinking zsh theme files..."
    zsh_themes.each do |file|
      sync_file file, "~/.oh-my-zsh/themes/"
    end
  end

end


# Defualt Tasks
# ===============================================

task :default => [ :dots, :scripts, :zsh ] do
  puts "\nAll Done."
end
