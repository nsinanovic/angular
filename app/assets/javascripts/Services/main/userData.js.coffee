angular.module('Blog').factory('userData', ['$http', ($http) ->

  userData =
    data:
      users: [{email: 'Loading', password: ''}]
    isLoaded: false

  userData.loadUsers = (deferred) ->
    if !userData.isLoaded
      $http.get('./users.json').success( (data) ->
        userData.data.users = data
        userData.isLoaded = true
        console.log('Successfully loaded users.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load users.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()


  userData.createUser = (newUser) ->
    # Client-side data validation
    if newUser.newUserEmail == '' or newUser.newUserPassword == ''
      alert('Neither the email nor the password are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_user:
        email: newUser.newUserEmail
        password: newUser.newUserPassword

    # Do POST request to /posts.json
    $http.post('./users.json', data).success( (data) ->

      # Add new post to array of posts
      userData.data.users.push(data)
      console.log('Successfully created user.')

    ).error( ->
      console.error('Failed to create new user.')
    )

    return true

  return userData

])