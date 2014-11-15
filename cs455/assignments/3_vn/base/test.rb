#!/usr/bin/ruby

module Execute
  def execute( cmd )
    puts "#{cmd}"
    res = `#{cmd}`
    return res
  end
end

class Tester
  include Execute
  def initialize( args )
    get_test_dir

    files = check_file_arg( args[0] )
    check_urcc_arg( args[1] )

    @report = "test_results.txt"
    execute("rm -f #{@report}") if File.file?(@report)

    @tests = Array.new

    files.each{ |f|
      @tests << Test.new( @test_dir, f, @urcc, @report )
    }
  end

  def test
    @tests.each{ |t| t.test }
    puts "Testing finished.  The results are in #{Dir.getwd}/#{@report}.\n\n"
    if @tests.size > 1
      res = execute("egrep -i \"CS255 Test|counter=\" #{Dir.getwd}/#{@report}")
      puts res
      puts "You may submit the above output as the result of the project."
    end 
  end

  def get_root_dir
    found = false
    file = '.hg'
    while not File.exist?(file) and File.directory?(File.dirname(file))
      file = '../' + file
    end
    if not File.exist?( file ) 
      abort("Abort: can't find the hg repository root in parent directories")
    end
    return File.dirname(File.expand_path( file ) )
  end

  def get_test_dir
    root = get_root_dir
    @test_dir = "#{root}/assignments/test_cases"
  end

  def check_file_arg( arg )
    all = []
    Dir.foreach(@test_dir) { |f| 
      all << f if f.end_with? '.c' and not f.include? '_urcc'
    }
    return all if ( arg.downcase == 'all' )
    
    file = File.basename(arg, ".c")
    if not File.exists?( "#{@test_dir}/#{file}.c")
      abort("Test program #{file}.c not found.  Choose one of the following: #{all * ', '}")
    end
    return ["#{file}.c"]
  end

  def check_urcc_arg( arg )
    abort( "#{arg} does not exist (or it is not an executable)" ) if not (File.exists?(arg) and File.executable?(arg))
    @urcc = arg
  end
end

class Test
  include Execute

  def initialize( dir, prog, urcc, report )
    @dir, @prog, @urcc, @report = dir, prog, urcc, report
    @params = Hash.new
    @params[ "automaton.c" ] = "1 0 0 1 0 0 -1"
    @params[ "binrep.c" ] = "255"
    @params[ "movingedge.c" ] = "455 42"
    @params[ "multiply.c" ] = "1000 50"
    @params[ "tax.c" ] = "20000 200 20 0 1 2100 0"
    @params[ "trivia.c" ] = "20"
    @params[ "odd.c" ] = "255"
  end

  def test
    puts "testing #{@prog} ..."
    src_file = File.join(@dir, @prog)
    bin_file = @prog[0..-3] + "_urcc.bin" 
    puts execute("#{@urcc} #{src_file}")
    execute("echo \"CS255 Test (#{Time.now}): #{@prog}\" >> #{@report}")
    if @params[ @prog ] != nil
      execute("echo \"#{@params[@prog]}\" | ./#{bin_file} >> #{@report}")
    else
      execute("./#{bin_file} >> #{@report}")
    end
  end
end

if ARGV.size != 2
  abort("\tUsage: test.rb [all | prog_name ] your_urcc_command\n\tExplanations: 'prog_name' is a test in assignments/test_cases. Use 'all' to test all .c files in the directory with standard inputs.")  
# You will be asked whether to submit the results.  New results may be submitted to replce the previous submission.")
end

tester = Tester.new( ARGV )
tester.test
