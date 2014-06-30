angular.module('Blog').factory('kategorijaData', ['$http', ($http) ->

  kategorijaData =
    data:
      kategorijas: [{title: 'Loading'}]
    isLoaded: false

  kategorijaData.loadKategorijas = (deferred) ->
    if !kategorijaData.isLoaded
      $http.get('./kategorijas.json').success( (data) ->
        kategorijaData.data.kategorijas = data

        kategorijaData.isLoaded = true
        console.log('Successfully loaded categories.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load categories.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()


  kategorijaData.createKategorija = (newKategorija) ->
    # Client-side data validation
    if newKategorija.newKategorijaTitle == ''
      alert('Neither the email nor the password are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_kategorija:
        title: newKategorija.newKategorijaTitle


    # Do POST request to /posts.json
    $http.post('./kategorijas.json', data).success( (data) ->

      # Add new post to array of posts
      kategorijaData.data.kategorijas.push(data)
      console.log('Successfully created category.')

    ).error( ->
      console.error('Failed to create new category.')
    )

    return true

  return kategorijaData

])