##VARIABLE
source_path = ARGV.first if ARGV.first != "-h"
f =  File.open(source_path, "r") if source_path != nil
flag_t = ARGV.find{|m| m == "-t"}
flag_o = ARGV.find{|m| m == "-o"}
flag_h = ARGV.find{|m| m == "-h"}
ext = ARGV.find{|m| m == "json" or m == "text" or m == "log"}
dest_path = ARGV.last

##PROCESS
if flag_t
    filename = File.basename(f, File.extname(f))
    dirname = File.dirname(f)
    if flag_o
        f = File.rename(source_path, dest_path)
    else
        f = File.rename(f, "#{filename}.#{ext}")
    end
elsif flag_o
    f = File.rename(source_path, dest_path)
elsif flag_h
    puts 'Use this file with the command like this'
    puts "ruby ChangeFile.rb 'Source Path your file' 'the flag -t/-o' 'json/text' 'Destination Path your file'"
    puts ' '
    puts "For Example: ruby ChangeFile.rb /var/lib/file.log -t json"
    puts "or"
    puts "ruby ChangeFile.rb /var/lib/file.log -t json -o /Documents/Users/file.json"
else
    f.each_line do |line|
        puts line
    end
end