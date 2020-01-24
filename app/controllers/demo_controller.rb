class DemoController < ApplicationController

  layout false

  def index
  end

  def hello
  end

  def other_hello
    redirect_to(:action => 'hello')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

end
