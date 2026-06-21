defmodule Calculator do
  # CLI avec mix run
  def main(args) do
    case args do
      [operation, a, b] ->
        a = String.to_integer(a)
        b = String.to_integer(b)

      operation
      |> run(a, b)
      |> format_result()
      |> IO.puts()

    _ ->
      IO.puts("Usage: calculator <operation> <a> <b>")
    end
  end

  def run("add", a, b) do
    {:ok, add(a, b)}
  end

  def run("substract", a, b) do
    {:ok, substract(a, b)}
  end

  def run("multiply", a, b) do
    {:ok, multiply(a, b)}
  end

  def run("divide", a, b) do
    divide(a, b)
  end

  def run("modulo", a, b) do
    modulo(a, b)
  end

  def run(_operation, _a, _b) do
    {:error, "Unknown operation"}
  end

  # définition des fonctions de calcul
  def add(a, b) do
    a + b
  end

  def substract(a, b) do
    a - b
  end

  def multiply(a, b) do
    a * b
  end

  def divide(_a, 0) do
    {:error, "Cannot divide by zero"}
  end

  def divide(a, b) do
    {:ok, a / b}
  end

  def modulo(_a, 0) do
    {:error, "Cannot modulo by zero"}
  end

  def modulo(a, b) do
    {:ok, rem(a, b)}
  end

  # display
  def format_result({:ok, result}) do
    "Result: #{result}"
  end

  def format_result({:error, reason}) do
    "Error: #{reason}"
  end
end
