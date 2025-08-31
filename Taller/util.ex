defmodule Util do
  def show_message(message) do
    System.cmd("java", ["-cp", ".", "Mensaje", message])
  end

  def input(data, :string) do
    System.cmd("java", ["-cp", ".", "Mensaje", "input", data])
    |> elem(0)
    |> String.trim()
  end

  def input(message, :integer) do
     try do
      message
      |> input(:string)
      |> String.to_integer()
    rescue
      ArgumentError -> show_message("Error: El valor ingresado no es un entero válido.")

      message
      |> input(:integer)
    end
  end

    def input(message, :float) do
     try do
      message
      |> input(:string)
      |> String.to_float()
    rescue
      ArgumentError -> show_message("Error: El valor ingresado no es un decimal válido.")

      message
      |> input(:float)
    end
  end

  def input(message, :number) do
    try do
      message
      |> input_number()
    rescue
      ArgumentError -> show_message("Error: El valor ingresado no es un número válido.")

      message
      |> input(:number)
    end
  end

    def input_number(data) do
    number_string = input(data, :string)
    try do
      String.to_integer(number_string)
    rescue
      _error -> String.to_float(number_string)
    end
  end
end
