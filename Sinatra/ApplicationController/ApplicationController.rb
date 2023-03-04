class ApplicationController <Sinatra::Base
    set :default_content_type, 'application/json'

    post "/todos" do
       todo = Todo.create(item: params[:item]),
       importance: params[:importance]
       category_id: params([:category_id])
  todo.to_json(include: {category: {only: [category]} })
     end

     get "/todos" do
        todos = Todo.all.order(:category_id)
        todos.to_json(include: {category: {only: [:category]} })
     end

     patch "/todos/:id" do
        todo = Todo.find(params[:id])
        todo.update(:item: params[:item])
        todo.to_json(include: {category: {only: [:category]} })
     end

     delete "/todos/:id" do
        todo  = Todo.find(params[:id])
        todo.destroy
        todo.to_json
     end
  end