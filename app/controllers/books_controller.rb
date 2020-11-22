class BooksController < ApplicationController

    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true)
    end

    def new
        @book = Book.new 
        @states = Book.states.keys.to_a
    end

    def create
        #creamos una vista para con los parametros que agregamos en book_params y luego redirigimos a root_path (crear esta ruta)
        @book = Book.create(book_params)
        # redirect_to root_path
        respond_to do |format|
            if @book.save
                format.html {redirect_to root_path, notice: "El libro fue creado"}
            else
                format.html {redirect_to new_book_path}
            end
        end
    end

    def show
    end

    def edit
        @states = Book.states.keys.to_a
    end

    def update
        @states = Book.states.keys.to_a
        respond_to do |f|
            if @book.update(book_params)
                f.html { redirect_to root_path, notice: 'Updated data' }
            else
                f.html { render :edit }
            end    
        end
    end

    def destroy
        @book.destroy
        redirect_to root_path
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :state, :borrowed_at, :returned_at)
    end
end

