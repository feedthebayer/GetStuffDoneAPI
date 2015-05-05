# GetStuffDoneAPI by Brandon

This is a [breakable toy](http://chimera.labs.oreilly.com/books/1234000001813/ch05.html#breakable_toys) created during my [Bloc apprenticeship](http://bloc.io). This is the third rails app that I have created on my own from a list of requirements (compared to following along tutorial style).

This app lives at [getstuffdoneapi.bayer.ws](http://getstuffdoneapi.bayer.ws)

## Description

This app is an API based todo list similar to [Todo.txt](http://todotxt.com/).

## Instructions

**Create a User:** POST to `/api/users` with `username` and `password` parameters.

*All of the below require HTTP basic auth using the above username and password.*

**Create a List:** POST to `/api/lists` with a `name` parameter

**Create an Item:** POST to `/api/lists/:list_id/items` with a `description` parameter

**View Resources:** You can GET the following
* `/api/users`
* `/api/lists`
* `/api/lists/:list_id/items`

**Update a Resource:** PUT to the corresponding url with the correct parameter.

**Delete a Resource:** DELETE to the corresponding url

