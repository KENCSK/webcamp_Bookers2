class SearchesController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
    @users = @records
    @books = @records
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'forward_match'
        User.where("name LIKE?", "#{content}%")
      elsif method == 'backward_match'
        User.where("name LIKE?", "%#{content}")
      else
        User.where('name LIKE ?', '%'+content+'%')
      end


    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      else
        Book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end

end
