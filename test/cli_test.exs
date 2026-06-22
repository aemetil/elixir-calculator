defmodule Calculator.CLITest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "prints help" do
    output =
      capture_io(fn ->
        Calculator.CLI.main(["help"])
      end)

    assert output =~ "Calculator CLI"
    assert output =~ "Usage:"
    assert output =~ "Operations:"
    assert output =~ "Examples:"
  end

  test "prints help with --help" do
    output =
      capture_io(fn ->
        Calculator.CLI.main(["--help"])
      end)

    assert output =~ "Calculator CLI"
  end

  test "prints help with -h" do
    output =
      capture_io(fn ->
        Calculator.CLI.main(["-h"])
      end)

    assert output =~ "Calculator CLI"
  end

  test "prints result for valid operation" do
    output =
      capture_io(fn ->
        Calculator.CLI.main(["add", "2", "3"])
      end)

    assert output == "Result: 5\n"
  end

  test "prints error for invalid number" do
    output =
      capture_io(fn ->
        Calculator.CLI.main(["add", "hello", "3"])
      end)

    assert output == "Error: Invalid number: hello\n"
  end

  test "prints usage for invalid arguments" do
    output =
      capture_io(fn ->
        Calculator.CLI.main(["add", "2"])
      end)

    assert output =~ "Usage: calculator <operation> <a> <b>"
    assert output =~ "Run `calculator help` for available operations."
  end
end
