class Menu < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes
  default_scope :order => 'lft ASC'
  attr_accessible :parent_id, :title, :uri, :in_main, :in_special, :in_footer, :in_tizer


  has_many :children, :class_name => 'Menu', :foreign_key => 'parent_id'
  
  scope :in_main, where("in_main = 1")
  scope :in_footer, where("in_footer = 1")
  scope :top, where("in_special = 1")


  def all_products
    get_all_by_parent_id(self.id)
  end

  def descendents
    children.map do |child|
      [child] + child.descendents
    end.flatten
  end

  def self_and_descendents
    [self] + descendents
  end
  def descendents_ids
    self_and_descendents.map(&:id).flatten
  end



  private
    def get_all_by_parent_id(parent_id)
      items = childs = Menu.where(:parent_id => parent_id)
      result = nil
      childs.each do |m|
        items.merge(get_all_by_parent_id(m.id))
      end
        items
    end
end
