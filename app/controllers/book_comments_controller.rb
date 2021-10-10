class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @content = current_user.book_comments.new(book_comment_params)
    @content.book_id = @book.id
    if @content.save
      render :book_comments
    else
      @user = @book.user
      @book_comment = BookComment.new
      render "error"
    end
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    @book = Book.find(params[:book_id])
    render :book_comments
  end


  private
  def book_comment_params
    params.require(:book_comment).permit(:content)
  end

end

