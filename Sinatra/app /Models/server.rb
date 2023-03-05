require 'sinatra'

## Model/Dataset

posts = [{title: "First Post", body: "content of first post"}]

## Index route
get '/posts' do
    # Return all the posts as JSON
    return posts.to_json
end

## Show Route
get '/posts/:id' do
    # return a particular post as json based on the id param from the url
    # Params always come to a string so we convert to an integer
    id = params["id"].to_i
    return posts[id].to_json
end

## Create Route
post '/posts' do
    # Pass the request into the custom getBody function
    body = getBody(request)
    # create the new post
    new_post = {title: body["title"], body: body["body"]}
    # push the new post into the array
    posts.push(new_post)
    # return the new post
    return new_post.to_json
end

{
    "title": "Another Post",
    "body":"content in the new post"
}


## Update Route
put '/posts/:id' do
    # get the id from params
    id = params["id"].to_i
    # get the request body
    body = getBody(request)
    #update the item in question
    posts[id][:title] = body["title"]
    posts[id][:body] = body["body"]
    #return the updated post
    return posts[id].to_json
end