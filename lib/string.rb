class String
  def sanitize
    self.strip.downcase.gsub(/\s+/, ' ')
  end
end