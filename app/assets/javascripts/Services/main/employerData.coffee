angular.module('Blog').factory('employerData', ['$http', ($http) ->

  employerData =
    data:
      employers: [{email: 'Loading', password: '', name:'', location:'', website:''}]
    isLoaded: false

  employerData.loadEmployers = (deferred) ->
    if !employerData.isLoaded
      $http.get('./employers.json').success( (data) ->
        employerData.data.employers = data
        employerData.isLoaded = true
        console.log('Successfully loaded employers.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load employers.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()



  employerData.createEmployer = (newEmployer,location) ->
    # Client-side data validation
    if newEmployer.newEmployerEmail == '' or newEmployer.newEmployerPassword == '' or newEmployer.newEmployerName == '' or newEmployer.newEmployerLocation == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false
    if newEmployer.newEmployerPassword != newEmployer.newEmployerProvjera
      alert( 'Invaid conformation of password')
      return false

    # Create data object to POST
    data =
      new_employer:
        email: newEmployer.newEmployerEmail
        password: newEmployer.newEmployerPassword
        name: newEmployer.newEmployerName
        location: newEmployer.newEmployerLocation
        website: newEmployer.newEmployerWebsite

    # Do POST request to /posts.json
    $http.post('./employers.json', data).success( (data) ->

      # Add new post to array of posts
      employerData.data.employers.push(data)
      console.log('Successfully created employer.')

    ).error( ->
      console.error('Failed to create new employer.')
    )
    location.url('/')

    return true

  return employerData

])