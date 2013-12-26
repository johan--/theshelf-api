require 'services/book_keeper'

describe BookKeeper do
  context "#lend_to" do
    it "lends the book to a user" do
      user = double("User")
      book = double("Book", available?: true)
      book_keeper = BookKeeper.new(book: book)

      book.should_receive(:lend_to!).with(borrower: user)

      book_keeper.lend_to user: user
    end

    context "book is borrowed" do
      it 'returns false' do
        book = double("Book", available?: false)
        book_keeper = BookKeeper.new(book: book)

        book_keeper.lend_to.should be_false
      end
    end
  end

  context '#return_by!' do
    it "changes the book's state to available" do
      user = build :user
      book = create(:lent_book, borrower: user)
      book_keeper = BookKeeper.new(book: book)

      book_keeper.return_by!(borrower: user)

      book.should be_available
    end

    it 'ends the loan' do
      user = build :user
      book = create(:lent_book, borrower: user)
      book_keeper = BookKeeper.new(book: book)

      book_keeper.return_by!(borrower: user)

      book.current_loan.should be_closed
    end

    it "returns false if the book wasn't borrowed by me" do
      current_borrower = double('User')
      another_user = double('User')
      book = double('Book', lent?: true, current_borrower: current_borrower)
      book_keeper = BookKeeper.new(book: book)

      book_keeper.return_by!(borrower: another_user).should be_false
    end

    it "returns false if the book isn't lent" do
      book = double('Book', lent?: false)
      book_keeper = BookKeeper.new(book: book)

      book_keeper.return_by!(borrower: double('User')).should be_false
    end

  end
end