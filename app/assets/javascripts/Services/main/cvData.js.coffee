angular.module('Blog').factory('cvData', ['$http', ($http) ->

  cvData =
    data:
      cvs: [{naslov: 'Loading', dodatno: ''}]
    isLoaded: false


  cvData.createCv = (newCv) ->
    # Client-side data validation
    if newCv.newCvDodatno == '' or newCv.newCvNaslov == ''
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

  cvData.editCv = (updateCv) ->
    #client-side validations
    if updateCv.editDodatno == '' or updateCv.editNaslov == ''
      alert('Neither the Title nor the Body are allowed to be left blank.')
      return false

    #create data object to post
    data =
      edit_cv:
        id: updateCv.editId
        naslov: updateCv.editNaslov
        dodatno: updateCv.editDodatno

    # Do POST request to /posts.json
    $http.put('./cvs.json', data).success( (data) ->

      # Add new post to array of posts
      cvData.data.cvs.push(data)
      console.log('Successfully updated cv.')

    ).error( ->
      console.error('Failed to update  cv.')
    )

    return true



  # postData.loadPosts = (deferred) ->
  #   if !postData.isLoaded
  #     $http.get('./posts.json').success( (data) ->
  #       postData.data.posts = data
  #       postData.isLoaded = true
  #       console.log('Successfully loaded posts.')
  #       if deferred
  #         deferred.resolve()
  #     ).error( ->
  #       console.error('Failed to load posts.')
  #       if deferred
  #         deferred.reject('Failed to load posts.')
  #     )
  #   else
  #     if deferred
  #       deferred.resolve()


  cvData.loadCvs = ->
    if !cvData.isLoaded
      $http.get('./cvs.json').success( (data) ->
      cvData.data.cvs = data
        cvData.isLoaded = true
        console.log('Successfully loaded cvs.')
      ).error( ->
        console.error('Failed to load cvs.')
      )

  return cvData

])



