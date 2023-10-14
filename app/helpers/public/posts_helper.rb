module Public::PostsHelper
  def render_with_hashtags(hashbody)
    if @post.hashbody.present? 
      hashbody.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "/post/hashtag/#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
    end
  end
end
