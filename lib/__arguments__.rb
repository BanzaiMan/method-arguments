module Arguments
  def __arguments__(bdg)
    method_symbol = caller(1,1).first.match(/\`(?<name>[^']*)'/)[:name].to_sym
    self.method(method_symbol).parameters.map { |e| [e[1], bdg.local_variable_get(e[1])] }
  end
end
