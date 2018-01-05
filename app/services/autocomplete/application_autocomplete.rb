module Autocomplete
  class ApplicationAutocomplete

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        total_count: count,
        results: results.map do |result|
          {
            id: id(result),
            text: text(result),
            element: element(result)
          }
        end
      }
    end

  end
end
