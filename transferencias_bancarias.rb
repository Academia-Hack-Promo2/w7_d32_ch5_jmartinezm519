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
  # def new
  #   @client = Client.New(name, last_name, id_number, email)
  # end

  def transfer_self(account_from, account_to, amount)
    

  end

  def transfer_other(account_from, account_to, amount)

  end
end

class Client < Bank
  attr_accessor :name, :last_name, :id_number, :email, :saving_account, :saving_amount, :check_account, :check_amount
  def initialize(name, last_name, id_number, email)
    @name = name
    @last_name = last_name
    @id_number = "V-" + id_number.to_s
    @email = email
    @saving_account = "0105067230" + rand(0000000000..9999999999).to_s
    @saving_amount = 100
    @check_account = "0105067240" + rand(0000000000..9999999999).to_s
    @check_amount = 100
  end

end


def main

  puts "\t\t\t========================".colorize(:blue)
  puts "\t\t\tBienvenidos a MyBank web".colorize(:blue) 
  puts "\t\t\t========================".colorize(:blue)

  while true
    puts"\nSeleccione una opcion:\n"
    puts "1- Crear cuenta en Mybank"
    puts "2- Revisar saldo en cuenta"
    puts "3- Realizar transferencia entre cuentas propias"
    puts "4- Realizar transferencia a terceros en MyBank"
    puts "5- Realizar transferencias a otros bancos"
    puts "0- Salir del sistema".colorize(:red)
    print "Opcion: "
    option = gets.chomp.to_s

    if !["1","2","3","4","5","0"].include?(option)
      puts "\nOpción invalida\n"
      redo
    end

    case option
      when "1"
        puts
        puts "Crearemos un nuevo usuario"
        puts
        puts "Introduzca su primer nombre"
        name = gets.chomp
        puts "Introduzca su primer apellido"
        last_name =gets.chomp
        puts "Introduzca su numero de cedula (solo numeros sin puntos)"
        id_number = gets.chomp
        puts "Introduzca su correo electronico"
        email = gets.chomp
        c1 = Client.new(name, last_name, id_number, email)
        puts
        puts "La cuentas del cliente #{c1.name} #{c1.last_name}, cedula: #{c1.id_number} han sido creadas satisfactoriamente".colorize(:blue)
        puts "Numero de cuenta de ahorros: #{c1.saving_account}".colorize(:blue)
        puts "Numero de cuenta de corriente: #{c1.check_account}".colorize(:blue)
        puts "Toda la informacion ha sido enviado al correo: #{c1.email}".colorize(:blue)

      when "2"
        puts
        if (defined?(c1))
          puts "Su saldo es:"
          puts "Cuentas de ahorros: Bs. #{c1.saving_amount}".colorize(:blue)
          puts "Cuentas de corriente: Bs. #{c1.check_amount}".colorize(:blue)
        else
          puts
          puts
          puts
          puts "=================================".colorize(:red)
          puts "Por favor cree al cliente primero".colorize(:red)
          puts "=================================".colorize(:red)
          puts
          puts
          puts

        end
      when "3"
        if (defined?(c1)).nil?
          puts "Modulo de transferencias entre cuentas propias"

        else
          puts
          puts
          puts
          puts "=================================".colorize(:red)
          puts "Por favor cree al cliente primero".colorize(:red)
          puts "=================================".colorize(:red)
          puts
          puts
          puts
        end
      when "4"
      when "5"
      when "0"
        puts
        puts "\t\t\t==========================".colorize(:blue)
        puts "\t\t\t\tHasta luego".colorize(:blue) 
        puts "\t\t\t==========================".colorize(:blue)
        abort



        
    end
  end
      
end

main