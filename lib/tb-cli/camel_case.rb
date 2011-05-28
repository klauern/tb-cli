# See the 'tb-cli/cli/rack' module for initializing Rack-based projects to see
# where this modification is being used.
class String

  # Stolen from StackOverflow: http://stackoverflow.com/questions/1509915/converting-camel-case-to-underscore-case-in-ruby
  # 
  # This converts a string from CamelCase to snake_case.  This allows all String
  # classes to call #underscore to get a proper conversion.
  #
  def underscore
    self.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
end

