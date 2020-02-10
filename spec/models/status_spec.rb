require "rails_helper"

RSpec.describe Status, type: :model do
  describe "#valid?" do
    it "ファクトリのモデルは有効" do
      expect(build(:status)).to be_valid
    end

    it "テキストが存在しない場合は無効" do
      status = build(:status, text: nil)
      status.valid?
      expect(status.errors.of_kind?(:text, :blank)).to be_truthy
    end

    it "141文字以上のテキストの場合は無効" do
      status = build(:status, text: "a" * 141)
      status.valid?
      expect(status.errors.of_kind?(:text, :too_long)).to be_truthy
    end
  end
end
