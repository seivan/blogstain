# Comment.blueprint do
#   post_id Post.first.try(:id) || Post.make.id
#   text "This is an example comment"
#   name "User"
# end
# 
# Comment.blueprint(:spam) do
#   text "acne adipex advicer baccarrat blackjack bllogspot booker buy byob carisoprodol"
# end