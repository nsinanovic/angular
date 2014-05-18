angular.module('Blog').factory('advartismentData', ['$http', ($http) ->

  advartismentData =
    data:
      advartisments: [{title: 'Loading', description: ''}]
    isLoaded: false

  advartismentData.loadAdvartisments = (deferred) ->
    if !advartismentData.isLoaded
      $http.get('./advartisments.json').success( (data) ->
        advartismentData.data.advartisments = data
        advartismentData.isLoaded = true
        console.log('Successfully loaded advartisments.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load advartisments.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()


  advartismentData.createAdvartisment = (newAdvartisment) ->
    # Client-side data validation
    if newAdvartisment.newAdvartismentTitle == '' or newAdvartisment.newAdvartismentDescription == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_advartisment:
        title: newAdvartisment.newAdvartismentTitle
        description: newAdvartisment.newAdvartismentDescription

    # Do POST request to /posts.json
    $http.post('./advartisments.json', data).success( (data) ->

      # Add new post to array of posts
      advartismentData.data.advartisments.push(data)
      console.log('Successfully created advartisment.')

    ).error( ->
      console.error('Failed to create new advartisment.')
    )

    return true

  return advartismentData

])