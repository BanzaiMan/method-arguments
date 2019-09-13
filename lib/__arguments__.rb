module Arguments
  # Returns an array indicating the arguments given tothe current method.
  #
  # @param bdg [Binding] binding in the current scope
  # @return [Array] array of 2-element arrys of the form `[symbol, value]`
  def __arguments__(bdg)
    method_symbol = caller(1,1).first.match(/\`(?<name>[^']*)'/)[:name].to_sym
    self.method(method_symbol).parameters.map { |e| [e[1], bdg.local_variable_get(e[1])] }
  end
end
