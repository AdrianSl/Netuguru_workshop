class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    return "#{review.user.firstname} #{review.user.lastname}"
  end

end
