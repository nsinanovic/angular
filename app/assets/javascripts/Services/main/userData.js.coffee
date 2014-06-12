angular.module('Blog').factory('userData', ['$http', ($http) ->

  userData =
    data:
      users: [{email: 'Loading', password: '', username:'', name:'', lastname:'', address: '', phone:''}]
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


  d=new Date()
  m= d.getMonth()+1
  y= d.getFullYear()


  userData.createUser = (newUser) ->
    # Client-side data validation
    if newUser.newUserEmail == '' or newUser.newUserPassword == '' or  newUser.newUserName == ''  or newUser.newUserLastname == '' or newUser.newUserAddress==''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_user:
        email: newUser.newUserEmail
        password: newUser.newUserPassword
        name: newUser.newUserName
        lastname: newUser.newUserLastname
        phone: newUser.newUserPhone
        address: newUser.newUserAddress
        username: d.getDate()+'/'+m+'/'+y

    # Do POST request to /posts.json
    $http.post('./users.json', data).success( (data) ->

      # Add new post to array of posts
      userData.data.users.push(data)
      console.log('Successfully created user.')

    ).error( ->
      console.error('Failed to create new user.')
    )

    return true

  userData.editUser = (updateUser) ->
      #cl ent-side validations
    if updateUser.editUserEmail == '' or updateUser.editUserPassword == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    #create data object to post
    data =
      edit_user:
        id: updateUser.editUserId
        password: updateUser.editUserPassword
        email: updateUser.editUserEmail
        name: updateUser.editUserName
        lastname: updateUser.editUserLastname
        address: updateUser.editUserAddress
        phone: updateUser.editUserPhone

    # Do POST request to /posts.json
    $http.post('./users.json', data).success( (data) ->

      # Add new post to array of posts
      userData.data.users.push(data)
      console.log('Successfully updated user.')

    ).error( ->
      console.error('Failed to update new user.')
    )

    return true





  return userData

])


