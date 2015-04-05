require 'colorize'
# Transferecnias Bancarias
# Los Clientes del banco MyBank, pueden realizar transferencias hacia sus propias cuentas, 
# o a cuentas a otros personas, sean del banco o de otros bancos. 

# Usted es contratado por el departamento de Tecnología del Banco, 
# y debe realizar el algoritmo del proceso 
# del sistema en ruby para el manejo de Transferencias.

# A a fin de estandarizar los procesos en este ejercicio, 
# los números de cuenta de todos los bancos son de 20 dígitos numéricos, 
# y las transferencias interbancarias se procesan inmediatamente.

# Para que una transferencia pueda ser realizada Los Clientes deben 
# contar con una cuenta en el banco, con saldo suficiente 
# para cubrir el monto de la transferencia, se debe verificar 
# que la cuenta destino cumpla con el standard.

# Luego de realizada la transferencia deben actualizarse los saldos
# tanto en la cuenta origen como destino. 
# y se debe enviar un mensaje de confirmación de la operación (si fue exitosa o no).

# Los clientes debe contar con la opción de visualizar los saldos 
# de sus cuentas en cualquier momento (antes o después de las transferencias)

class Bank
end

class Client
  def initialize(name, last_name, id_number, email)
    @name = name
    @last_name = last_name
    @id_number = id_number
    @email = email
    @saving_account = rand(20)
    @check_account = rand(20)
  end

end


def hello
  puts "\t\t\t========================".colorize(:blue)
  puts "\t\t\tBienvenidos a MyBank web".colorize(:blue)
  puts "\t\t\t========================".colorize(:blue)
end

def options
  puts"\nSeleccione una opcion:\n"
  puts "1- Crear cuenta en Mybank"
  puts "2- Revisar saldo en cuenta"
  puts "3- Realizar transferencia entre cuentas propias"
  puts "4- Realizar transferencia a terceros en MyBank"
  puts "5- Realizar transferencias a otros bancos"
  puts "0- Salir del sistema".colorize(:red)
  option = gets.chomp
  return option
end

def main
  hello
  options
end

main