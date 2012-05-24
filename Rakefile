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

def make_symlink( file, prefix )

  path   = File.join(File.dirname(__FILE__), file)
  name   = File.basename(file)
  target = File.expand_path("#{prefix}#{name}")

  rm_rf target if File.exists?(target)
  ln_s path, target

end


# Dotfiles
# ===============================================

task :dots do

  header "Copying dotfiles..."
  dots.each do |file|
    make_symlink file, "~/."
  end

end


# Scripts
# ===============================================

task :scripts do

  header "Symlinking script files..."
  scripts.each do |file|
    make_symlink file, "~/Developer/scripts/"
  end

end


# Oh My ZSH
# ===============================================

task :zsh =>  [ "zsh:custom", "zsh:themes" ]
namespace :zsh do

  task :custom do
    header "Symlinking zsh custom directory..."
    make_symlink zsh_custom, "~/.oh-my-zsh/"
  end

  task :themes do
    header "Symlinking zsh theme files..."
    zsh_themes.each do |file|
      make_symlink file, "~/.oh-my-zsh/themes/"
    end
  end

end


# Defualt Tasks
# ===============================================

task :default => [ :dots, :scripts, :zsh ] do
  puts "\nAll Done."
end
