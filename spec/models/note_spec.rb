require 'rails_helper'

RSpec.describe Note, type: :model do

  before do
    @user = User.create(
      first_name: "Marcus",
      last_name: "Magnusson",
      email: "marmag@bredband2.se",
      password: "myPassword"
    )

    @project = @user.projects.create(
      name: "Test project",
    )

  end

  it "is invalid wihtout a message" do
    note = Note.new(message: nil)
    note.valid?
    expect(note.errors[:message]).to include("can't be blank")
  end

  describe "search message for a term" do
    before do
      @note1 = @project.notes.create(
        message: "The first note",
        user: @user,
      )
      @note2 = @project.notes.create(
        message: "The second note",
        user: @user,
      )
      @note3 = @project.notes.create(
        message: "Not the first note",
        user: @user,
      )
    end

    # use context instead of describe inside of a describe block
    context "when a match is found" do
      it "returns notes that match the term" do
        expect(Note.search("first")).to include(@note1, @note3)
      end
    end


    context "when no match is found" do
      it "returns empty collection" do
        expect(Note.search("message")).to be_empty
      end
    end
  end
  end
