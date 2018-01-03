module ApplicationHelper
  def display_amount(dollars)
    format("%.2f", dollars)
  end
end
