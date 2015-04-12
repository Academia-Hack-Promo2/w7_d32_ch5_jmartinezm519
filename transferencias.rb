require 'colorize'
class Bank 
  @@bank_name = "MyBank"
  @@clients = []

  def new_account(name, last_name, id_number, email, saving_amount=500, 
                check_account=500)
    @client = Client.new(name, last_name, id_number, email, saving_amount, 
                check_account)

    puts "La cuentas del cliente: "
    puts "#{@client.name} #{@client.last_name}, CI: #{@client.id_number} "
    puts "han sido creadas satisfactoriamente"
    print "Numero de cuenta de ahorros:".colorize(:blue)
    print "\t #{@client.saving_account}\n".colorize(:red)
    print "Numero de cuenta de corriente:".colorize(:blue)
    print"\t #{@client.check_account}\n".colorize(:red)
    puts "Toda la informacion ha sido enviado al correo: #{@client.email}".colorize(:blue)
   
    @@clients << @client
  end 

  def balance
  end

  def self_transfer(origin_account, destination_account)

    success_transfer
  end

  def others_transfer(origin_account, destination_account)

    success_transfer
  end

  def clients
    puts @@clients
  end

  private
    def success_transfer
      respuesta = "La tranferencia entre la cuenta #{origin_account}"\
                  "y la cuenta #{destination_account} fue realizada"\
                  "con exito"
      puts respuesta
    end

end

# Se instaciar nuevos clientes con 2 cuentas una de ahorro y otra corriente
# cada cuenta tiene un monto minimo de apertura por defecto de Bs.500
# Las cuentas se generan automaticamente 

class Client
  attr_reader :name, :last_name, :id_number, :email, :saving_account, 
              :saving_amount, :check_account, :check_amount

  def initialize(name, last_name, id_number, email, saving_amount, 
                check_account)
    @name = name
    @last_name = last_name
    @id_number = "V-" + id_number.to_s
    @email = email
    @saving_account = "0105067230" + rand(0000000000..9999999999).to_s
    @saving_amount = saving_account
    @check_account = "0105067240" + rand(0000000000..9999999999).to_s
    @check_amount = check_amount
  end

end


def main
  my_bank = Bank.new
  client_1 = my_bank.new_account("Jonathan", "Martinez", 18619519, 
                                "jamm@jmartinezm.org")

  client_2 = my_bank.new_account("Alberto", "Mercado", 17519619, 
                                "jamm@outlook.com")

  
end

main