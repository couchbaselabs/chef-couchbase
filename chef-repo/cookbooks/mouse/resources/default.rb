actions :say

attribute :given_name, :name_attribute => true
attribute :phrase, :default => "squeak"
attribute :tail, :default =>true, :kind_of => [TrueClass, FalseClass]

