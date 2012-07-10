require "defaultinator/version"

class Module
  # todo: figure out how to mix this in as a module slightly nicer
  alias_method :__original_attr_accessor, :attr_accessor
  def attr_accessor *args
    return send(:__original_attr_accessor, *args) unless args.last.is_a?(Hash)
    *method_names, method_options = args
    attr_reader(*method_names, method_options)
    attr_writer(*method_names)
  end

  alias_method :__original_attr_reader, :attr_reader
  def attr_reader *args
    # Hand-off if no options for us to be clever with
    return send(:__original_attr_reader, *args) unless args.last.is_a?(Hash)

    *method_names, method_options = args

    # Hand-off if no defaults or if the default is nil, because that's the ruby runtime default too.
    return send(:__original_attr_reader, *method_names) unless method_options.has_key?(:default) && method_options[:default] != nil

    method_names.uniq.each do |name|
      instance_name = "@#{name}".to_sym
      # @foo ||= {}
      define_method(name) do
        instance_variable_defined?(instance_name) && instance_variable_get(instance_name) || instance_variable_set(instance_name, method_options[:default])
      end
    end
  end
end
