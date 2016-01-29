require 'gosu'

class Game < Gosu::Window
  attr_reader :jogador1, :jogador2

  def initialize
    super(600, 600)
    self.caption = "Jogo da velha"

    @background_image = Gosu::Image.new(self, "assets/background.gif", true)
    @jogada = Gosu::Image.new(self, "assets/cross.png", true)
  end

  def draw
    @background_image.draw(0,0,0)
    @jogada.draw(0,0,1)
  end


  def update
  end

  def inicia_jogador
    @jogador1 = []
    @jogador2 = []
  end



  def jogadas_vencedoras
    #possiveis jogadas vencedoras
    @vencedor = [[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9],
                 [1, 4, 7],
                 [2, 5, 8],
                 [3, 6, 9],
                 [1, 5, 9],
                 [3, 5, 7]]

  end


  def verifica_se_jogador_ganhou(jogador)
    @vencedor.each do |row|
      if verifica_jogada_ganhadora(row, jogador)
        return true
      end
    end
    false
  end

  def verifica_jogada_ganhadora(linha, jogador)
    tem = 0
    linha.each do |i|

      if jogador.include? i
        tem += 1
      end
    end

    tem == 3
  end

  # Posicoes
  # 1 2 3
  # 4 5 6
  # 7 8 9

  # 0 é a o valor default da matriz
  # 1 é cross
  # 2 é circle


  def inicializa_tabuleiro
    @tabuleiro = Hash.new
    for posicao in 1..9
      @tabuleiro[posicao] = 0
    end
  end


  def inicia_posicao
    @posicao[1] = [0, 0];
  end



  def desenha_jogada(posicao, desenho)
    @jogada.draw(0,0,1)
  end


  def debug

  end

end

window = Game.new
#window.show
window.inicializa_tabuleiro
window.inicia_jogador
window.jogadas_vencedoras
#window.desenha_jogada(1, "cross")
window.debug

#window.jogador1 << 1
#window.jogador1 << 4
#window.jogador1 << 7


p window.verifica_se_jogador_ganhou(window.jogador1)

