# filepath: spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  it "should belong to category" do
    association = described_class.reflect_on_association(:category)
    expect(association.macro).to eq :belongs_to
  end

  it "should belong to user" do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end

  it "should belong to priority" do
    association = described_class.reflect_on_association(:priority)
    expect(association.macro).to eq :belongs_to
  end

  it "should belong to status" do
    association = described_class.reflect_on_association(:status)
    expect(association.macro).to eq :belongs_to
  end

  it "should have many subtasks" do
    association = described_class.reflect_on_association(:subtasks)
    expect(association.macro).to eq :has_many
  end
end