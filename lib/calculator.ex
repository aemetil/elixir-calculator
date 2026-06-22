defmodule Calculator do
  # centraliser la liste des opérations
  def operations do
  [
    %{name: "add", description: "Add two numbers"},
    %{name: "subtract", description: "Subtract second number from first number"},
    %{name: "multiply", description: "Multiply two numbers"},
    %{name: "divide", description: "Divide first number by second number"},
    %{name: "modulo", description: "Get remainder of division"},
    %{name: "power", description: "Raise first number to the power of second number"}
  ]
  end

  # functions run/3
  def run("add", a, b) do
    {:ok, add(a, b)}
  end

  def run("subtract", a, b) do
    {:ok, subtract(a, b)}
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

  def run("power", a, b) do
    {:ok, power(a, b)}
  end

  def run(_operation, _a, _b) do
    {:error, "Unknown operation"}
  end

  # définition des fonctions de calcul
  def add(a, b) do
    a + b
  end

  def subtract(a, b) do
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

  def power(a, b) do
    :math.pow(a, b)
  end

  # éviter le plantage
  def parse_number(value) do
    case Integer.parse(value) do
      {number, ""} ->
        {:ok, number}

      _->
        {:error, "Invalid number: #{value}"}
    end
  end

  # display
  def format_result({:ok, result}) do
    "Result: #{result}"
  end

  def format_result({:error, reason}) do
    "Error: #{reason}"
  end
end
