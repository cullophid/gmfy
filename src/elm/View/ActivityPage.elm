module View.Activity where


activityPage : (Activity -> Html
activityPage activity  =
  div [class "col-md-6 col-md-offset-3"] [
    h1 [] [text activity.title]
  ]
