class MicroTest
  class << self
    def run
      @test_classes.shuffle.each do |klass|
        klass.public_instance_methods.grep(/_test/).each do |name|
          begin
            if klass.instance_methods.include?(:setup)
              klass.new.instance_eval {
                setup
                send(name)
              }
            else
              klass.new.send(name)
            end
          rescue RuntimeError => e
            (@reports ||= []) << Report.new(e, klass.file_name)
          end
        end
      end
    ensure
      print "\n" * 2
      print @reports.map(&:result).join("\n" * 2)
      puts
    end

    def inherited(base)
      (@test_classes ||= []) << base
    end

    def file_name
      name.gsub(/\B[A-Z]/, "_\\&").gsub(/::/, "_").downcase
    end
  end
end
