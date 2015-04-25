# Rakefile
# ===============================================

# Config
# ===============================================

dotfiles = Dir["dots/*"]

# Dotfiles
# ===============================================

task :dotfiles do
  header "Copying dotfiles..."
  dotfiles.each do |file|
    sync_file file, "~/."
  end
end

# Default Tasks
# ===============================================

task :default => [ :dotfiles ] do
  puts "\nAll Done."
end # default


# Helpers
# ===============================================

def header(message)
  puts "\n=================================================|\n"
  puts " #{message}"
  puts "=================================================|\n\n"
end

def sync_file( file, prefix, options = {} )

  options[:dry_run] ||= false
  options[:copy] ||= false

  name = File.basename(file)
  source = File.join(File.dirname(__FILE__), file)
  target = File.expand_path("#{prefix}#{name}")
  sync_method = ( options[:copy] ) ? 'copy' : 'symlink'

  if !options[:dry_run]
    rm_rf target if File.exists?(target)
    if options[:copy]
      cp_r source, target, { :preserve => true }
    else
      ln_s source, target
    end
  else
    puts "Will #{sync_method} #{name} => #{prefix}#{name}"
  end

end
