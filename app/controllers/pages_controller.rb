class PagesController < ApplicationController

  def government
    @posts = Post.all.limit(100)
    @users = User.all.limit(100)

    # keywords
    @berlin_tags = most_common(Tag.near("Berlin", 150).map {|n| n.word})
    @istanbul_tags = most_common(Tag.near("Istanbul", 150).map {|n| n.word})
    @toronto_tags = most_common(Tag.near("Toronto", 150).map {|n| n.word})
  end

  def refugee_search
  end

  def refugee_show
    @user = User.find_by(name: params[:name])
    if @user.blank?
      flash[:danger] = "User not found"
      redirect_to(:back)
      return
    end
  end

  private

  def most_common posts
    url_count = posts.each_with_object(Hash.new(0)) do |item, count|
      count[item] += 1
    end
    top_urls = url_count.keys.sort_by!{|url| url_count[url]}.last(5).reverse!
    return top_urls
  end
end
