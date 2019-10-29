# frozen_string_literal: true
module Zizia
  module ApplicationHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
      link_to title, { sort: column, direction: direction }, class: css_class
    end

    def collections_for_select
      ActiveFedora::SolrService.query('has_model_ssim:Collection').map do |c|
        [c['title_tesim'][0], c['id']]
      end
    end

    def collections?
      !ActiveFedora::SolrService.query('has_model_ssim:Collection').empty?
    end
  end
end
