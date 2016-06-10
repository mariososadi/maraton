require 'csv'

class Maraton

  def self.controller

    $ask = CSV.read("cards.csv")
    $ask.delete_if {|x| x.empty?}
    $buenas = 0
    $malas = 0
    Maraton.preguntas
    puts ""
    puts "Acabaste: "
    puts "Tuviste #{$buenas} Correctas y #{$malas} Incorrectas."
    puts "Gracias por jugar."  
    puts ""
   
  end

  def self.preguntas

    until $ask.empty?
      $answer = $ask.pop(2).flatten
      puts ""
      puts "Pregunta"
      puts $answer[0]
      Maraton.respuestas
    end

  end

  def self.respuestas
    print "Intento:  "
    @intento = gets.chomp
    if @intento == $answer[1]
      puts "¡Correcto! :D"
      $buenas += 1
    else
      puts "¡Incorrecto! :("
      $malas += 1
    end
  end



end


puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."  
puts "Listo?  Arranca el juego!"
Maraton.new
Maraton.controller
