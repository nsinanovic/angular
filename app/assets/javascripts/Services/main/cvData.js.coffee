angular.module('Blog').factory('cvData', ['$http', ($http) ->

  cvData =
    data:
      cvs: [{naslov: 'Loading', dodatno: ''}]
    isLoaded: false

  cvData.loadCvs = (deferred) ->
    if !cvData.isLoaded
      $http.get('./cvs.json').success( (data) ->
        cvData.data.cvs = data
        cvData.isLoaded = true
        console.log('Successfully loaded cvs.')

      ).error( ->
        console.error('Failed to load cvs.')

      )


  cvData.createCv = (newCv) ->
    # Client-side data validation
    if newCv.newCvNaslov == '' or newCv.newCvDodatno == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_cv:
        naslov: newCv.newCvNaslov
        dodatno: newCv.newCvDodatno

    # Do POST request to /posts.json
    $http.post('./cvs.json', data).success( (data) ->

      # Add new post to array of posts
      cvData.data.cvs.push(data)
      console.log('Successfully created cv.')

    ).error( ->
      console.error('Failed to create new cv.')
    )

    return true

  return cvData

])