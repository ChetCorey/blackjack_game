# keep information about card rules
class Card
  def initialize(ranks, suits)
    @rank = ranks
    @suit = suits
  end

  def rank
    @rank
  end

  def suit
    @suit
  end

  def rank_value # if card("ace") is
    case
    when :A then 1
    when :J then 10
    when :Q then 10
    when :K then 10
    else
      rank
    end
  end
end
