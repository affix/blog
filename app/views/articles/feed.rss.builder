xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Keiran.SCOT"
    xml.description "A blog by Keiran Smith"
    xml.link articles_url

    for post in @articles
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link article_url(post)
        xml.guid article_url(post)
      end
    end
  end
end
