class MicroTest

  class Report
    def initialize(error, file_name)
      @error = error
      @file_name = file_name
    end

    def result
      result_string = []
      result_string << "Test Failed: " + @error.message + " (RuntimeError) at " + @error.backtrace.grep(Regexp.new(@file_name))[0]
      result_string << "\t" + @error.backtrace.join("\n\t")
      result_string.join("\n")
    end
  end
end
