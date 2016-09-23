module ApplicationHelper

  def get_tag_list
    Tag.all
  end

  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:id].present?
      svg['id'] = options[:id]
    end
    doc.to_html.html_safe
  end
end
