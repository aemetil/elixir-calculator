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
    operations_text =
      Calculator.operations()
      |> Enum.map_join("\n", fn operation ->
        "  #{String.pad_trailing(operation.name, 9)} #{operation.description}"
      end)

    IO.puts(
      "Calculator CLI\n\n" <>
        "Usage:\n" <>
        "  calculator <operation> <a> <b>\n\n" <>
        "Operations:\n" <>
        operations_text <>
        "\n\n" <>
        "Examples:\n" <>
        "  calculator add 2 3\n" <>
        "  calculator divide 10 2\n" <>
        "  calculator modulo 10 3\n"
    )
  end
end
