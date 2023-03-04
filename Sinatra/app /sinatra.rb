#create

fetch("http://localhost:9292/todos")
method: "POST"
headers: {
    "Content-Type": "application/json",
},

body: JSOn.stringify({
 item: todo,
 importance: importance,
 category_id: category_id

}),

{(
.then((r)) => r.json())
.then(newTodo => {
onAddTodo(newTodo)
setTodo("/")
setImportance("/")
setCategoryId("/")
})

}

#Read
 useEffect(() =>{
 fetch('http://localhost:9292/todos')
 .then(r => r.json())
.then(todos => setTodos(todos))
 }, [])

 #Update
fetch(`http://localhost:9292/todos/${todo.id})`, {
 method: "PATCH"
   headers: {
    "Content-Type": "application/json",
   },
})
body:JSON.stringfly({
    item: todoUpdate,
}),
{(
.then((r) => r.json())
.then((updatedTodo => {
     onUpdateTodo(updatedTodo)
     setTodoUpdate('')
}))
)}


#Delete
fetch(`http://localhost:9292/todos/${todo.id}`, {
    method: "DELETE",
})
onTodoDelete(todo.id)
