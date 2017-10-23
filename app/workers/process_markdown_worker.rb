class ProcessMarkdownWorker
  include Sidekiq::Worker
  require 'redcarpet/compat'

  def perform(post_id)
    post = Post.find post_id
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    post.html = markdown.render(post.markdown)

    post.save
  end
end
