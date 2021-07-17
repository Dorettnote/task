module Math
  def add(x,y)
    x + y
  end
  
  def average(x,y)
    (x + y) / 2
  end
  
  def debug()
    puts "debug from module"
  end
  
  module_function :add,:average
  
end

module SubModule
  def debug()
    puts "debug from submodule"
  end
end

class CallModule
  #Mix-in ミックスイン（モジュールを読み込む）
  # クラスメソッドとして呼ぶ場合はextend
  include Math
  include SubModule
  
  def test_add(x,y)
    r = add(x,y)
	print "add : x = ",x," y = ",y," result = ",r,"\n"
  end
  
  def test_average(x,y)
    r = average(x,y)
	print "average : x = ",x," y = ",y," result = ",r,"\n"
  end
  
  def show_debug()
    debug
  end
end

# クラスのインスタンスからモジュールを使ったメソッドを呼ぶ
test = CallModule.new

test.test_add(10,5)
test.test_average(30,50)
test.show_debug

class << test
  def hello
    puts "hello"
  end
end
test.hello

#test.test_on_call_module

# モジュールのもつメソッドを直接呼ぶ（module_functionで設定したメソッドのみ）
puts Math.add(100,200)

# クラス拡張
class String
  def count_word
    a = self.split(/\s+/)
	a.size
  end
  
  def debug
    print "debug :",self
  end
end

message = "stay foolish stay hungry"
p message.count_word
p message.debug

"test".debug
