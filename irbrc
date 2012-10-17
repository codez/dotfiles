require 'rubygems'

@@warnings = {}

def extend_irb(lib)
  begin
    require lib
    yield if block_given?
  rescue LoadError => err
    @@warnings[lib] = err.message
  end
end

# auto completion
extend_irb 'irb/completion'

# colorize output
extend_irb 'wirble' do
  Wirble.init
  Wirble.colorize
end

# output structured objects
extend_irb 'ap' do
  alias pp ap
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
end

# output active records as tables
extend_irb 'hirb' do
  Hirb.enable
  extend Hirb::Console
end

# print log messages to irb console
if defined?(Rails) && Rails.env
  if Rails.logger
    Rails.logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
 end
end

warn "Could not load #{@@warnings.keys.join(', ')}" unless @@warnings.empty?
