# frozen_string_literal: true

module PaginationHelper
  def pagination_window(current_page, total_pages, window_size = 10)
    start_page = [ current_page - window_size / 2, 1 ].max
    end_page   = [ start_page + window_size - 1, total_pages ].min
    start_page = [ end_page - window_size + 1, 1 ].max
    (start_page..end_page)
  end
end
