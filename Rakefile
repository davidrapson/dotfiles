# Rakefile
# ===============================================

# Config
# ===============================================

dotfiles   = Dir["dots/*"]
zsh_themes = Dir["zsh/themes/*"]
zsh_custom = "zsh/custom"


# Dotfiles
# ===============================================

task :dotfiles do

  header "Copying dotfiles..."
  dotfiles.each do |file|
    sync_file file, "~/."
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

end # :zsh


# Git Submodules
# ===============================================


task :submodules =>  [ "submodules:setup" ]

namespace :submodules do

  desc "Init and update submodules."
  task :setup do
    header "Git submodules"
    `git submodule update --init`
  end

  desc "Upgrade all bundled plugins"
  task :update do
    `git submodule foreach git pull origin master`
  end

end # :zsh


# Default Tasks
# ===============================================

task :default => [ :dotfiles, :zsh, :submodules ] do
  puts "\nAll Done."
end # default


# Helpers
# ===============================================

def header(message)

  puts "\n=================================================|\n"
  puts " #{message}"
  puts "=================================================|\n\n"

end # header


def sync_file( file, prefix, options = {} )

  options[:dry_run] ||= false
  options[:copy]    ||= false

  source              = File.join(File.dirname(__FILE__), file)
  name                = File.basename(file)
  target              = File.expand_path("#{prefix}#{name}")

  # Copy
  if options[:copy]

    if !options[:dry_run]
      rm_rf target if File.exists?(target)
      cp_r source, target, { :preserve => true }
    else
      puts "Will copy #{name}  =>  #{prefix}#{name}"
    end

  # Symlink
  else

    if !options[:dry_run]
      rm_rf target if File.exists?(target)
      ln_s source, target
    else
      puts "Will symlink #{name}  =>  #{prefix}#{name}"
    end

  end

end # sync_file
