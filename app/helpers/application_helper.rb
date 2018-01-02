module ApplicationHelper
  def display_dollars(cents)
    dollars = cents.to_f / 100
    "$#{format("%.2f", dollars)}"
  end
end
