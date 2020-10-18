module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.username.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end

  def check_photo(user)
    if user.Photo.attached?
      image_tag(user.Photo, class: 'img')
    else
      content_tag(:div, 'No photo', class: %w[bg_gray circle img-none])
    end
  end

  def check_cover(user)
    image_tag(user.coverIimage, class: 'cover_img') if user.CoverIimage.attached?
  end

  def opinions(opinions)
    @opinions = opinions
    render '/layouts/opinion'
  end

  def follow
    return if current_user.id == @user.id

    if current_user.followed.any? || current_user.include?(follower) { |person| person.followed_id == @user.id }
      link_to unfollow_path(@user), method: :delete, class: 'font-unfollow-icon fas fa-minus-circle fa-2x'
    else
      link_to follow_path(@user), class: 'font-follow-icon fas fa-plus-circle fa-2x'
    end
  end
end
