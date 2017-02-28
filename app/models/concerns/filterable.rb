module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter_and(filter_params)
      results = self.where(nil)
      filter_params.each do |key, value|
        results = results.public_send(key, value).distinct if value.present?
      end
      results
    end
  end
end