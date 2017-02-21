module UsersHelper
  # Returns the Gravatar for the given user
  def gravatar_for(user)
    # create the md5 hash
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # compile URL
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: 'gravatar')
  end
end
