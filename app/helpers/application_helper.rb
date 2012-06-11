module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::XHTML.new(
      filter_html: true,
      safe_links_only: true,
      hard_wrap: true
    )
    markdown = Redcarpet::Markdown.new(
      renderer,
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
    )
    markdown.render(text).html_safe
  end
end
