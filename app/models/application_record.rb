class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_json(symbolize: false, attrs: [])
    new_json = JSON.parse(super)
    new_json.slice!(*attrs.map(&:to_s)) if attrs.any?
    new_json.symbolize_keys! if symbolize

    new_json
  end
end
