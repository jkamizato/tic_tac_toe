require 'test/unit'
require_relative 'tabuleiro'

class TabuleiroTest < Test::Unit::TestCase


  def setup
    @meu_tabuleiro = Tabuleiro.new
    @meu_tabuleiro.jogadas_vencedoras
    @meu_tabuleiro.inicia_jogador
  end

  def test_jogada_ganhadora_simples
    @meu_tabuleiro.faz_jogada(@meu_tabuleiro.jogador1, 1)
    @meu_tabuleiro.faz_jogada(@meu_tabuleiro.jogador1, 2)
    @meu_tabuleiro.faz_jogada(@meu_tabuleiro.jogador1, 3)


    assert_true(@meu_tabuleiro.verifica_se_jogador_ganhou(@meu_tabuleiro.jogador1))
  end

  def test_jogada_perdedora_simples
    @meu_tabuleiro.faz_jogada(@meu_tabuleiro.jogador1, 3)
    @meu_tabuleiro.faz_jogada(@meu_tabuleiro.jogador1, 6)
    @meu_tabuleiro.faz_jogada(@meu_tabuleiro.jogador1, 2)
    assert_false(@meu_tabuleiro.verifica_se_jogador_ganhou(@meu_tabuleiro.jogador1))
  end

  def test_mudanca_jogador
    @meu_tabuleiro.set_quem_joga(1)
    @meu_tabuleiro.muda_jogada_para_outro
    assert_equal(2, @meu_tabuleiro.quem_joga)
  end


end