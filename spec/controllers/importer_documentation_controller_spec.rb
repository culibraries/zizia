# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Zizia::ImporterDocumentationController, type: :controller do
  routes { Zizia::Engine.routes }

  describe "GET csv" do
    it "provides a csv download" do
      get :csv
      expect(response.headers['Content-Type']).to eq('text/csv; charset=utf-8')
      expect(response.headers['Content-Disposition']).to eq('attachment; filename="import_template.csv"')
    end
  end
end
