class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    content = current_user.book_comments.new(book_comment_params)
    content.book_id = book.id
    if content.save
      redirect_to book_path(book)
    else
      @user = @book.user
      render "books/show"
    end
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end


  private
  def book_comment_params
    params.require(:book_comment).permit(:content)
  end

end
