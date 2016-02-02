require 'gosu'
require_relative 'tabuleiro'

class Game < Gosu::Window


  def initialize
    super(600, 600)
    self.caption = "Jogo da velha"

    @background_image = Gosu::Image.new(self, "assets/background.gif", true)
    @jogada = Gosu::Image.new(self, "assets/cross.png", true)
  end

  def draw

    @background_image.draw(0,0,0)
  end

  def draw_cross_casa(casa)
    @jogada.draw(0, 0, 1)
  end

  def update
    #if Gosu::button_down?Gosu
  end


  # Posicoes
  # 1 2 3
  # 4 5 6
  # 7 8 9

  # 0 é a o valor default da matriz
  # 1 é cross
  # 2 é circle


  def desenha_jogada(posicao, desenho)
    @jogada.draw(0,0,1)
  end

  def play
    meu_tabuleiro = Tabuleiro.new
    meu_tabuleiro.play
  end

end

window = Game.new
#window.show
window.play