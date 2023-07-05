class Pagination
  DEFAULT_PER_PAGE = 10

  def initialize(page:, limit:)
    @page = page
    @limit = limit
  end

  def page_no
    page&.to_i || 1
  end

  def per_page
    limit&.to_i || DEFAULT_PER_PAGE
  end

  def offset
    (page_no - 1) * per_page
  end

  private

  attr_reader :page, :limit
end
