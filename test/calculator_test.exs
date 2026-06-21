defmodule CalculatorTest do
  use ExUnit.Case

  test "divide two numbers" do
    assert Calculator.divide(10, 2) == {:ok, 5.0}
  end

  test "cannot divide by zero" do
    assert Calculator.divide(10, 0) == {:error, "Cannot divide by zero"}
  end

end


# à tester
# mix test
# Calculator.format_result(Calculator.run("modulo", 10, 3))
# Calculator.format_result(Calculator.run("modulo", 10, 0))
# Calculator.format_result(Calculator.run("unknown", 10, 3))
