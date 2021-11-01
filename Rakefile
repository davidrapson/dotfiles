# frozen_string_literal: true

task :default do
  puts "\nSymlinking dotfiles…\n\n"
  Dir['dots/*'].each do |file|
    source = File.join(File.dirname(__FILE__), file)
    target = File.expand_path("#{Dir.home}/.#{File.basename(file)}")
    ln_s source, target, force: true
  end
  puts "\nAll Done."
end
