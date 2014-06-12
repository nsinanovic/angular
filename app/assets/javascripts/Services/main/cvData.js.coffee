angular.module('Blog').factory('cvData', ['$http', ($http) ->

  cvData =
    data:
      cvs: [{naslov: 'Loading', dodatno: '', jezici:'', strucnaSprema:'', radnoIskustvo:'', vjestine: '', obrazovanje:''}]
    isLoaded: false

  cvData.loadCvs = (deferred) ->
    if !cvData.isLoaded
      $http.get('./cvs.json').success( (data) ->
        cvData.data.cvs = data
        cvData.isLoaded = true
        console.log('Successfully loaded cvs.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load cvs.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()




  cvData.createCv = (newcv) ->
    # Client-side data validation


    # Create data object to POST
    data =
      new_cv:
        naslov: newcv.newCvNaslov
        dodatno: newcv.newCvDodatno
        jezici: newcv.newCvJezici
        radnoIskustvo: newcv.newCvRadno
        obrazovanje: newcv.newCvObrazovanje
        vjestine: newcv.newCvVjestine

    # Do POST request to /posts.json
    $http.post('./cvs.json', data).success( (data) ->

      # Add new post to array of posts
      cvData.data.cvs.push(data)
      console.log('Successfully created cv.')

    ).error( ->
      console.error('Failed to create new cv.')
    )

    return true

  cvData.editCv = (updatecv) ->
    #cl ent-side validations


    #create data object to post
    data =
      edit_cv:
        id: updatecv.editCvId
        naslov: updatecv.editCvNaslov
        dodatno: updatecv.editCvDodatno
        jezici: updatecv.editCvJezici
        radnoIskustvo: updatecv.editCvRadnoIskustvo
        obrazovanje: updatecv.editCvObrazovanje
        vjestine: updatecv.editCvVjestine
    # Do POST request to /posts.json
    $http.post('./cvs.json', data).success( (data) ->

      # Add new post to array of posts
      cvData.data.cvs.push(data)
      console.log('Successfully updated cv.')

    ).error( ->
      console.error('Failed to update new cv.')
    )

    return true





  return cvData

])


