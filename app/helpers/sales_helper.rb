module SalesHelper

  def upcoming_sale?
    Sale.upcoming.any?
    # Sale.where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current).any?
    #not showing becausei in db, there is no sale event now
    #change above to true will show
  end


end
