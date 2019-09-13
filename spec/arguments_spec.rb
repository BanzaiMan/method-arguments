require '__arguments__'

class Foo
  include Arguments

  def mandatory_1(a)
    __arguments__ binding
  end

  def mandatory_2(a, b)
    __arguments__ binding
  end

  def keywords(kw1:,kw2:)
    __arguments__ binding
  end

  def mixture(mandatory, optional="default", mandatory_kw:, optional_kw: "default_kw")
    __arguments__ binding
  end

  def rest(a, b, *rest)
    __arguments__ binding
  end

  def keywords_rest(a:, b:, **rest)
    __arguments__ binding
  end
end

describe '#__arguments__' do
  let(:subject) { Foo.new }
  it 'works with a method with a single required arg' do
    expect(subject.mandatory_1("value")).to eq [[:a, "value"]]
  end

  it 'works with a method with 2 required args' do
    expect(subject.mandatory_2("value1", "value2")).to eq [[:a, "value1"], [:b, "value2"]]
  end

  it 'works with mixed method signature' do
    expect(subject.mixture("mandatory", mandatory_kw: "given")).to eq [
      [:mandatory, "mandatory"], [:optional, "default"], [:mandatory_kw, "given"], [:optional_kw, "default_kw"]
    ]
    expect(subject.mixture("mandatory", "overridden", mandatory_kw: "given")).to eq [
      [:mandatory, "mandatory"], [:optional, "overridden"], [:mandatory_kw, "given"], [:optional_kw, "default_kw"]
    ]
  end

  it 'works with a method that takes arbitrary number of arguments' do
    expect(subject.rest("uno", "dos", "tres", "cuatro", "cinco")).to eq [
      [:a, "uno"], [:b, "dos"], [:rest, ["tres", "cuatro", "cinco"]]
    ]
  end

  it 'works with a method that takes arbitrary number of keyword arguments' do
    expect(subject.keywords_rest(a: "once", c: "doce", b: "trece", d: "catorce", e: "quince")).to eq [
      [:a, "once"], [:b, "trece"], [:rest, {:c=>"doce", :d=>"catorce", :e=>"quince"}]
    ]
  end
end
