angular.module('Blog').factory('notificationData', ['$http', ($http) ->

  notificationData =
    data:
      notifications: [{user_id: 'Loading', kategorija_id: '', kategorija: ''}]
    isLoaded: false

  notificationData.loadNotifications = (deferred) ->
    if !notificationData.isLoaded
      $http.get('./notifications.json').success( (data) ->
        notificationData.data.notifications = data
        notificationData.isLoaded = true
        console.log('Successfully loaded notifications.')
        if deferred
          deferred.resolve()
      ).error( ->
        console.error('Failed to load nostinksbd.')
        if deferred
          deferred.resolve()
      )
    else
      if deferred
        deferred.resolve()


  notificationData.createNotification = (newNotification) ->
    # Client-side data validation


    # Create data object to POST
    data =
      new_notification:

        kategorija: newNotification.newKategorija.kategorija

    # Do POST request to /posts.json
    $http.post('./notifications.json', data).success( (data) ->

      # Add new post to array of posts
      notificationData.data.notifications.push(data)
      console.log('Successfully created not.')

    ).error( ->
      console.error('Failed to create new not.')
    )

    return true

    notificationData.deleteNotification = (updateNotification) ->
      #create data object to delete post
    data =
      delete_notification:
        id: updateNotification.editNotificationId

        kategorija: updateNotification.editKategorija


    # Do POST request to /posts.json
    $http.post('./notifications.json', data).success( (data) ->

      # Add new post to array of posts
      notificationData.data.notifications.push(data)
      console.log('Successfully deleted not.')

    ).error( ->
      console.error('Failed to delete not.')
    )

    return true

  return notificationData

])