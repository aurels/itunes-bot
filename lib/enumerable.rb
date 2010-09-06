module Enumerable
  def select_with_index
    index = -1
    (block_given? && self.class == Range || self.class == Array)  ?  select { |x| index += 1; yield(x, index) }  :  self
  end
  
  def collect_with_index
    index = -1
    (block_given? && self.class == Range || self.class == Array)  ?  collect { |x| index += 1; yield(x, index) }  :  self
  end
end