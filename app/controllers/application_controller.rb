class ApplicationController < ActionController::Base
    def find_tags_for_post
        @post = Post.find_by(title: "Post 1")
        @tags = @post.tag_list
      end
end
