class Reply
  include ActionView::Helpers::TextHelper # pluralize

  def self.call(user:)
    new(user: user).call
  end

  include Virtus.model

  attribute :user, User

  def call
    thank_you + "\n> " + fact
  end

  def thank_you
    case cups_this_month
    when 1
      first_cup
    else
      many_cups
    end
  end

  def first_cup
    [
      "Thank you for using a disposable cup. You rock!"
    ].sample
  end

  def many_cups
    [
      "Awesome! You've used #{human_cups_count} this month!",
      "#{human_cups_count} so far. Well done!"
    ].sample
  end

  def fact
    [
      "Did you know that during the manufacturing process, paper coffee cups are laminated with a plastic resin called polyethylene? This helps keep beverages warm and prevents the paper from absorbing liquids and leaking — but the plastic also prevents the cup from being recycled.",
      "16 billion paper cups are used for coffee every single year. This translates to over 6.5 million trees cut down, 4 billion gallons of water wasted, and enough energy used to power nearly 54,000 homes for a year.",
      "By switching from paper cups to reusable mugs, you’ll also help save paper, reduce chlorine used to bleach cups and lessen your contribution to landfills.",
      "Styrofoam cups are made from polystyrene. Like most plastics, it is an oil-based product. Fossil fuels are therefore heavily involved in the product itself as well as in the process of manufacturing it.",
      "Styrofoam cannot biodegrade in any normal sense of the word. Nor can it be fully recycled. The mountains of cups being thrown out today will mostly still be in landfill sites in 500 years time.",
      "Paper cups do not biodegrade because of the polystyrene",
      "Paper cups require cutting down trees because recycled paper cups leak",
      "A study by Starbucks in 2000 calculated that the average paper-based coffee cup produced 0.24 lb of CO2.  Disposable cups not only contribute directly to the creation of a major greenhouse gas, they also create a lot of waste.",
      "One cup per day results in 23 lb of waste by the end of the year, just from the cups that are thrown away.",
      "Although reusable cups have a bigger initial environmental impact than paper ones when they are first made, over time, they become more resource-efficient than throwaway cups.",
      "Since a coffee mug or tumbler is designed to be used about 3,000 times in its life, it provides about eight years of use for the average daily coffee drinker.",
      "The simple act of using a reusable mug would lead to a great reduction in waste and energy consumption."
    ].sample
  end

  def human_cups_count
    pluralize(cups_this_month, "disposable cup")
  end

  def cups_this_month
    @count ||= user.cups.where("created_at > ?", Time.now.beginning_of_month).count
  end
end
