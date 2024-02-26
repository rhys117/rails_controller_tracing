module RailsControllerTracing
  # A lot of this methodology is inspired by sorbet-runtime
  # - and modified from their approach to defining method signatures
  module MethodHooks
    def method_added(name)
      super(name)


    end

    def singleton_method_added(name)
      super(name)


    end

    def replace_method(klass, method_name)
      original_method = klass.instance_method(method_name)
      original_visibility = visibility_method_name(klass, method_name)
      original_owner = original_method.owner


    end

    def visibility_method_name(klass, name)
      if klass.public_method_defined?(name)
        :public
      elsif klass.protected_method_defined?(name)
        :protected
      elsif klass.private_method_defined?(name)
        :private
      else
        raise StandardError.new("undefined method `#{name}` for `#{klass}`")
      end
    end
  end
end
