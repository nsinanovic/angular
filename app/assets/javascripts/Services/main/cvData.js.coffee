angular.module('Blog').factory('cvData', ['$http', '$location', ($http) ->

  cvData =
    data:
      cvs: [{
        naslov: '',
        dodatno: '',
        obrazovanje: '',
        strucnaSprema:'',
        radnoIskustvo:'',
        jezici:'',
        vjestine:'',
        ostaleInformacije:''
      }]
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


  cvData.createCv = (newCv) ->
    # Client-side data validation


    # Create data object to POST
    data =
      new_cv:
        naslov: newCv.newCvNaslov
        dodatno: newCv.newCvDodatno
        obrazovanje: newCv.newCvObrazovanje
        radnoIskustvo: newCv.newCvRadno
        strucnaSprema: newCv.newCvSprema
        jezici: newCv.newCvJezici
        ostaleInformacije: newCv.newCvDodatno

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