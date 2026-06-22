# Calculator CLI

Small command-line calculator built with Elixir.

The goal is to learn Elixir basics by building a real CLI tool step by step.

---

## Features

Supported operations:

```bash
./calculator add 2 3
./calculator subtract 10 4
./calculator multiply 4 5
./calculator divide 10 2
./calculator modulo 10 3
./calculator power 2 3
```

The CLI also supports help commands:

```bash
./calculator help
./calculator --help
./calculator -h
```

---

## Requirements

- Elixir
- Erlang/OTP
- Mix

Check your installation:

```bash
elixir --version
mix --version
```

---

## Installation

Clone the repository:

```bash
gh repo clone aemetil/elixir-calculator
cd calculator
```

Install dependencies:

```bash
mix deps.get
```

This project currently has no external dependencies, but `mix deps.get` is still a good habit.

---

## Run with Mix

You can run the CLI script directly with Mix:

```bash
mix run calc.exs -- add 2 3
```

Example output:

```text
Result: 5
```

---

## Build executable

Build the executable with:

```bash
mix escript.build
```

This creates a local executable named:

```bash
calculator
```

Run it with:

```bash
./calculator add 2 3
```

Example output:

```text
Result: 5
```

---

## Usage

General format:

```bash
./calculator <operation> <a> <b>
```

Examples:

```bash
./calculator add 2 3
./calculator subtract 10 4
./calculator multiply 4 5
./calculator divide 10 2
./calculator modulo 10 3
./calculator power 2 3
```

---

## Error handling

Division by zero:

```bash
./calculator divide 10 0
```

Output:

```text
Error: Cannot divide by zero
```

Invalid number:

```bash
./calculator add hello 3
```

Output:

```text
Error: Invalid number: hello
```

Invalid arguments:

```bash
./calculator add 2
```

Output:

```text
Usage: calculator <operation> <a> <b>
Run `calculator help` for available operations.
```

---

## Run tests

Run the full test suite:

```bash
mix test
```

Expected result:

```text
0 failures
```

---

## What this project covers

This project introduces:

- Elixir modules
- functions
- pattern matching
- tuples
- `{:ok, result}` / `{:error, reason}` conventions
- `case`
- guards
- lists
- maps
- pipelines
- CLI arguments with `System.argv/0`
- parsing with `Integer.parse/1`
- output with `IO.puts/1`
- tests with ExUnit
- CLI output testing with `ExUnit.CaptureIO`
- executable builds with `escript`
