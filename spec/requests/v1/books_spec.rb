require 'rails_helper'

describe 'Books API', type: :request do
  context 'get /books' do
    it 'sends a list of books' do
      allow(Book).to receive(:all).and_return(build_stubbed_list(:book, 10))

      get '/books', nil, {'accept' => 'application/json; version=1'}

      expect(response).to be_success
      expect(parsed_response.length).to eq 10
    end
  end

  context 'get /book' do
    it 'sends the details of a book' do
      book = build_stubbed(:book)
      allow(Book).to receive(:find).and_return(book)

      get "/books/#{book.id}", nil, {'accept' => 'application/json; version=1'}

      expect(response).to be_success
      expect(parsed_response['id']).to eq book.id
    end

    it 'sends an error code' do
      get '/books/99', nil, {'accept' => 'application/json; version=1'}

      expect(response).to be_not_found
    end
  end

  context 'delete /book' do
    it 'deletes a book' do
      book = create :book
      allow(Book).to receive(:find).and_return(book)

      delete "/books/#{book.id}", nil, {'accept' => 'application/json; version=1'}

      expect(response).to be_success
      expect(parsed_response['id']).to eq book.id
    end

    it 'sends an error code' do
      delete '/books/99', nil, {'accept' => 'application/json; version=1'}

      expect(response).to be_not_found
    end
  end

  context 'update /book' do
    it 'updates a book' do
      book = create :book

      title = 'testAPI'
      book_params = {
        'book' => {
          'title' => title
        }
      }

      put "/books/#{book.id}", book_params,
      {'accept' => 'application/json; version=1'}

      expect(response).to be_success
      expect(parsed_response['title']).to eq title
    end

    it 'sends an error code on wrong params' do
      book = create :book

      put "/books/#{book.id}", nil, {'accept' => 'application/json; version=1'}

      expect(response).to be_bad_request
    end
  end
end