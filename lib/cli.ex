defmodule Calculator.CLI do
  def main(args) do
    case args do
      [command] when command in ["help", "--help", "-h"] ->
        print_help()

      [operation, a, b] ->
        case {Calculator.parse_number(a), Calculator.parse_number(b)} do
          {{:ok, number_a}, {:ok, number_b}} ->
            operation
            |> Calculator.run(number_a, number_b)
            |> Calculator.format_result()
            |> IO.puts()

          {{:error, reason}, _} ->
            IO.puts("Error: #{reason}")

          {_, {:error, reason}} ->
            IO.puts("Error: #{reason}")
        end

      _ ->
        IO.puts("Usage: calculator <operation> <a> <b>")
        IO.puts("Run `calculator help` for available operations.")
    end
  end

 #hellp commands
 def print_help do
    IO.puts("""
    Calculator CLI

    Usage:
      calculator <operation> <a> <b>

    Operations:
      add       Add two numbers
      subtract  Subtract second number from first number
      multiply  Multiply two numbers
      divide    Divide first number by second number
      modulo    Get remainder of division
      power     Raise first number to the power of second number

    Examples:
      calculator add 2 3
      calculator divide 10 2
      calculator modulo 10 3
    """)
  end
end
