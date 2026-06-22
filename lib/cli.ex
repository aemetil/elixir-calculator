defmodule Calculator.CLI do
  def main(args) do
    case args do
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
    end
  end
end
