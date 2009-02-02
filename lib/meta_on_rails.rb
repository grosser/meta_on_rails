module MetaOnRails
  def set_meta(meta = {})
    @meta = meta
  end
  
  def display_meta(default = {})
    meta = default.merge(@meta||{}).reject{|k,v|v.blank?}
    meta.map do |key,value|
      %Q[<meta name="#{key}" content="#{normalize(value)}"/>]
    end.join("\n")
  end
  
  private

  # strip tags
  # remove unecessary whitespace
  # squeeze duplicate whitespace
  def normalize(s)
    s.gsub(/<\/?[^>]*>/, '').gsub('"',"'").gsub(/\s/,' ').squeeze(' ')
  end
end
