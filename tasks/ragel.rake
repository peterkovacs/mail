require 'erb'

MAIL_ROOT = File.expand_path("../..", __FILE__)
require "#{MAIL_ROOT}/lib/mail/parsers/ragel/parser_info"

namespace :ragel do
  # Ruby Parsers
  RB_DIR = "#{MAIL_ROOT}/lib/mail/parsers/ragel/ruby"
  RB_RAGEL_TEMPLATE = "#{RB_DIR}/parser.rb.rl.erb"
  def generate_rb_ragel_file(parser_name)
    parser_name_cc = parser_name.gsub('parser','machine').split('_').map{|e| e.capitalize}.join + "Machine"
    ragel_rb_source_template = ERB.new(IO.read(RB_RAGEL_TEMPLATE))
    ragel_rb_source_template.result(binding)
  end

  RB_GEN_DIR = "#{RB_DIR}/machines"

  directory RB_GEN_DIR

  RB_ACTIONS = "#{RB_GEN_DIR}/rb_actions.rl"
  file RB_ACTIONS do
    actions = Mail::Parsers::Ragel::ACTIONS.each_with_index.map do |action,idx|
      "action #{action} { actions.push(#{idx}, p) }"
    end.join("\n")
    actions_rl = "%%{\nmachine rb_actions;\n#{actions}\n}%%"
    File.open(RB_ACTIONS,"w+") { |f| f.write actions_rl }
  end

  RB_RAGEL_PARSERS = [ ]
  Mail::Parsers::Ragel::FIELD_PARSERS.each do |p|
    path = "#{RB_GEN_DIR}/#{p}_machine.rb.rl"
    RB_RAGEL_PARSERS << path
    file path do
      puts "Generating #{path}"
      File.open(path, "w+") { |f| f.write(generate_rb_ragel_file(p)) }
    end
  end
  RB_RAGEL_FILES = [RB_GEN_DIR, RB_ACTIONS] + RB_RAGEL_PARSERS

  task :generate_ragel_files => RB_RAGEL_FILES

  RB_PARSERS = []
  RB_RAGEL_PARSERS.each do |ragel_path|
    path = ragel_path.gsub(".rl", "")
    RB_PARSERS << path
    puts "#{path}"
    file path do
      puts "ragel -sR -F1 -o #{path} #{ragel_path}"
      `ragel -sR -F1 -o #{path} #{ragel_path}`
    end
  end

  file "#{MAIL_ROOT}/lib/mail/parsers/ragel/uuencode.rb" do
    puts "ragel -sR -F1 -o #{MAIL_ROOT}/lib/mail/parsers/ragel/uuencode.rb #{MAIL_ROOT}/lib/mail/parsers/ragel/uuencode.rb.rl"
    `ragel -sR -F1 -o #{MAIL_ROOT}/lib/mail/parsers/ragel/uuencode.rb #{MAIL_ROOT}/lib/mail/parsers/ragel/uuencode.rb.rl`
  end

  task :generate_ruby_parsers => RB_PARSERS + [ "#{MAIL_ROOT}/lib/mail/parsers/ragel/uuencode.rb" ]

  desc "Generate ruby parsers from ragel files"
  task :generate => [:generate_ragel_files, :generate_ruby_parsers]

  task :clean do
    ( RB_PARSERS + [ RB_ACTIONS ] + RB_RAGEL_PARSERS ).each do |file|
      File.delete( file ) if File.exists?( file )
    end
  end

end
