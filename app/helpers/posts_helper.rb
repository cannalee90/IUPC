module PostsHelper
  def deleteSpan(comment)
    if is_admin?
      link_to "delete", comment_path(comment), method: :delete, class: "label label-danger"
    end
  end

  def completed?(post)
    content_tag(:span, "답변", class: "label label-success margin-left-10") if post.comments.size != 0
  end
end
