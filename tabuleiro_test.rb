require 'test/unit'
require_relative 'tabuleiro'

class TabuleiroTest < Test::Unit::TestCase


  def setup
    @meu_tabuleiro = Tabuleiro.new
    @meu_tabuleiro.jogadas_vencedoras
  end

  def test_jogada_ganhadora_simples

    jogador = {jogadas: [1,2,3] }
    assert_true(@meu_tabuleiro.verifica_se_jogador_ganhou(jogador))
  end

  def test_jogada_perdedora_simples
    jogador = {jogadas: [1,2,5] }
    assert_false(@meu_tabuleiro.verifica_se_jogador_ganhou(jogador))
  end
end