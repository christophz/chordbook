module ApplicationHelper

    def markdown(text)
        options = {
            filter_html: true,
            hard_wrap: true,
            link_attributes: { rel: 'nofollow', target: "_blank" },
            space_after_headers: true,
            fenced_code_blocks: true
        }

        extensions = {
            autolink: true,
            superscript: true,
            disable_indented_code_blocks: false
        }

        renderer = Redcarpet::Render::HTML.new(options)
        markdown = Redcarpet::Markdown.new(renderer, extensions)

        markdown.render(text).html_safe
    end

    def title(page_title)
        content_for :title, page_title.to_s
    end

end
