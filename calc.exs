# améliorer la CLI
args =
  System.argv()
  |> Enum.reject(fn arg -> arg == "--" end)
Calculator.CLI.main(args)

 #Calculator.main(System.argv())

# pour tester manuellement
# mix run calc.exs -- add 2 3 //Result: 5
# mix run calc.exs -- add 10 0 //Error: Cannot divide by zero

# Or
# mix run -e 'Calculator.main(["add", "2", "3"])'
