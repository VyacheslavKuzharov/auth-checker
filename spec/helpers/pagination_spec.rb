require_relative "../../app/helpers/pagination"

RSpec.describe Pagination do
  subject { described_class.new(page: page, limit: limit) }

  let(:page) { nil }
  let(:limit) { nil }

  describe "#page_no" do
    context "when page presents" do
      let(:page) { 2 }

      it "returns correct page number" do
        expect(subject.page_no).to eq(2)
      end
    end

    context "when page is blank" do
      it "returns correct page number" do
        expect(subject.page_no).to eq(1)
      end
    end
  end

  describe "#per_page" do
    context "when limit presents" do
      let(:limit) { 2 }

      it "returns correct limit number" do
        expect(subject.per_page).to eq(2)
      end
    end

    context "when limit is blank" do
      it "returns correct page number" do
        expect(subject.per_page).to eq(Pagination::DEFAULT_PER_PAGE)
      end
    end
  end

  describe "#offset" do
    let(:page) { 3 }
    let(:limit) { 3 }

    it "returns correct records offset" do
      expect(subject.offset).to eq(6)
    end
  end
end
