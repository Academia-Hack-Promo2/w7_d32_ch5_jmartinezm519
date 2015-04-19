require 'colorize'

# Se instacia nuevos clientes con 2 cuentas una de ahorro y otra corriente
# cada cuenta tiene un monto minimo de apertura por defecto de Bs.500
# Las cuentas se generan automaticamente 

class Client
  attr_accessor :name, :last_name, :id_number, :email, :saving_account, :saving_amount, :check_account, :check_amount

  def initialize(name, last_name, id_number, email, saving_amount=500, check_amount =500)
    @name = name
    @last_name = last_name
    @id_number = "V-" + id_number.to_s
    @email = email
    @saving_account = "0105067230" + rand(0000000000..9999999999).to_s
    @check_account = "0105067240" + rand(0000000000..9999999999).to_s
    @saving_amount = saving_amount
    @check_amount = check_amount
  end

  def to_s
     format_client = "\n#{@id_number} #{@name} #{@last_name}"\
                     "\n#{@email}"\
                     "\n#{@saving_account} #{@saving_amount}"\
                     "\n#{@check_account} #{@saving_amount}"
    return format_client
  end

end

class Bank < Client

  def initialize bank_name
    @bank_name = bank_name
  end

  # Muestra el balance del saldo en las cuentas del cliente
  def balance client
      puts "Estimado Sr./Sra #{client.name} #{client.last_name}"
      puts "Su saldo es:"
      puts "Cuentas de ahorros: Bs. #{client.saving_amount}".colorize(:blue)
      puts "Cuentas de corriente: Bs. #{client.check_amount}".colorize(:blue)
  end

  # Metodo para relizar transferencia entre las cuentas del cliente
  def self_transfer(client, amount)
    puts "Seleccione la cuenta origen de la cual trasladara los fondos (opciones ahorro o corriente):"
    origin = gets.chomp.to_s.downcase
    case origin
    when "ahorro"
      if client.saving_amount >= amount
        client.saving_amount -= amount
        client.check_amount += amount
        success_transfer
      else
        no_money
      end
    when "corriente"
      if client.check_amount >= amount
        client.check_amount -= amount
        client.saving_amount += amount
        success_transfer
      else
        no_money
      end
    else 
      return "Las opciones validas son ahorro y corriente"
    end 
  end

  # Metodo para transferir a otros clientes del banco
  def others_transfer_same_bank(client, client1, amount)
    puts "Seleccione la cuenta origen de la cual trasladara los fondos (opciones ahorro o corriente):"
    origin = gets.chomp.to_s.downcase
    puts "Seleccione a que cuenta desea trasladar los fondos:"
    puts "Ahorro #{client1.saving_account} opcion 1"
    puts "Corriente #{client1.check_account} opcion 2"
    destination = gets.chomp.to_i

    if origin == "ahorro" && destination == 1
      if client.saving_amount >= amount
        client.saving_amount -= amount
        client1.saving_amount += amount
        success_transfer
      else
        no_money
      end
    elsif origin == "ahorro" && destination == 2
      if client.check_amount >= amount
        client.saving_amount -= amount
        client1.check_amount += amount
        success_transfer
      else
        no_money
      end
    elsif origin == "corriente" && destination == 1
      if client.check_amount >= amount
        client.check_amount -= amount
        client1.saving_amount += amount
        success_transfer
      else
        no_money
      end
    elsif origin == "corriente" && destination == 2
      if client.saving_amount >= amount
        client.check_amount -= amount
        client1.check_amount += amount
        success_transfer
      else
        no_money
      end
    else 
      return "Las opciones validas son ahorro y corriente"
    end 
  end

 # metodo para transferir a cuentas de otros bancos
  def other_transfer_diferent_bank
    puts "Seleccione la cuenta origen de la cual trasladara los fondos (opciones ahorro o corriente):"
    origin = gets.chomp.to_s.downcase
    puts "Escriba la cuenta a la que desea trasladar el dinero"
    destination = gets.chomp.to_i
    case origin
    when "ahorro"
      if client.saving_amount >= amount
        client.saving_amount -= amount
        success_transfer
      else
        no_money
      end
    when "corriente"
      if client.check_amount >= amount
        client.check_amount -= amount
        success_transfer
      else
        no_money
      end
    else 
      return "Las opciones validas son ahorro y corriente"
    end 



  end
  private
    def success_transfer
      puts "La tranferenciafue realizada con exito".colorize(:blue)
    end
    def no_money
      puts "El saldo en su cuenta origen es insuficiente".colorize(:red)
    end

end

def main

  

end

main