defmodule CalculatorTest do
  use ExUnit.Case

  # tests automatisés
  test "divide two numbers" do
    assert Calculator.run("add", 2, 3) == {:ok, 5}
  end

  test "substact two numbers" do
    assert Calculator.run("substract", 10, 4) == {:ok, 6}
  end

  test "multiplies two numbers" do
    assert Calculator.run("multiply", 4, 5) == {:ok, 20}
  end

  test "divides two numbers" do
    assert Calculator.run("divide", 10, 2) == {:ok, 5.0}
  end

  test "does not divides by zero" do
    assert Calculator.run("divide", 10, 0) == {:error, "Cannot divide by zero"}
  end

  test "calculates modulo" do
    assert Calculator.run("modulo", 10, 3) == {:ok, 1}
  end

  test "does not modulo by zero" do
    assert Calculator.run("modulo", 10, 0) == {:error, "Cannot modulo by zero"}
  end

  test "returns error for unknown operation" do
    assert Calculator.run("unknown", 10, 3) == {:error, "Unknown operation"}
  end

  test "parses valid number" do
    assert Calculator.parse_number("42") == {:ok, 42}
  end

  test "parses negative number" do
    assert Calculator.parse_number("-5") == {:ok, -5}
  end

  test "returns error for invalid number" do
    assert Calculator.parse_number("hello") == {:error, "Invalid number: hello"}
  end

  test "returns error for partially invalid number" do
    assert Calculator.parse_number("10abc") == {:error, "Invalid number: 10abc"}
  end

  test "formats succes result" do
    assert Calculator.format_result({:ok, 5}) == "Result: 5"
  end

  test "formats error result" do
    assert Calculator.format_result({:error, "Boom"}) == "Error: Boom"
  end
end


# run test auto
# mix test

# tests manuel
# Calculator.format_result(Calculator.run("modulo", 10, 3))
# Calculator.format_result(Calculator.run("modulo", 10, 0))
# Calculator.format_result(Calculator.run("unknown", 10, 3))
