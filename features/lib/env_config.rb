#Module that loads environment configurations

module EnvConfig
  @@config = YAML.load_file "#{File.dirname(__FILE__)}/../../config/#{ENVIRONMENT}.yml"

  def self.get(parent, child = nil)
    parent = get_sub_tree @@config, parent
    child.nil? ? parent : get_sub_tree(parent, child)
  end

  def self.get_sub_tree(root, item)
    sub_tree = root[item.to_sym]
    raise "Could not locate '#{item}' in YAML config: '#{root}'" if sub_tree.nil?
    sub_tree
  end
  private_class_method :get_sub_tree
end
