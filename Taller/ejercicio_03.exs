defmodule Main do
  def main() do
    nombre = Util.input("Ingrese su nombre: ", :string)
    temperatura_c = Util.input("Ingrese la temperatura (C°): ", :number)
    temperatura_f = temperatura_c * 9 / 5 + 32
    temperatura_k = temperatura_c + 273.15

    Util.show_message(
      "Hola #{nombre}, la temperatura en Fahrenheit es: #{Float.round(temperatura_f, 1)} °F y
    en Kelvin es: #{Float.round(temperatura_k, 1)} K"
    )
  end
end

Main.main()
