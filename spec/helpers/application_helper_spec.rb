require 'spec_helper'
describe SimonAsks::ApplicationHelper do
  describe "#paginator" do

    before do
      10.times do 
        question = create :question
      end
      @questions = SimonAsks::Question
    end

    context 'kaminari or similar is included' do

      before do
        require 'kaminari'
        Kaminari::Helpers::Paginator.stub(:new).and_return("Works!")
        @questions = @questions.page(1)
      end

      it 'initializes and displays pagination for collection' do
        expect(helper.paginator(@questions)).to be_a(String)
      end

    end

    context 'no pagination gem is included' do

      it 'returns nothing' do
        expect(helper.paginator(@questions)).to be_nil
      end

    end

  end
end