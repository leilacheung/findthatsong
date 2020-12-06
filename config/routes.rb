Rails.application.routes.draw do

  get("/", { :controller => "user_authentication", :action => "base" })

  get("/home", { :controller => "user_authentication", :action => "base"})


  # Routes for the Mood resource:

  # CREATE
  post("/insert_mood", { :controller => "moods", :action => "create" })
          
  # READ
  get("/moods", { :controller => "moods", :action => "index" })
  
  get("/moods/:path_id", { :controller => "moods", :action => "show" })
  
  # UPDATE
  
  post("/modify_mood/:path_id", { :controller => "moods", :action => "update" })
  
  # DELETE
  get("/delete_mood/:path_id", { :controller => "moods", :action => "destroy" })

  #------------------------------

  # Routes for the Song resource:

  # CREATE
  post("/insert_song", { :controller => "songs", :action => "create" })
          
  # READ
  get("/songs", { :controller => "songs", :action => "index" })
  
  get("/songs/:path_id", { :controller => "songs", :action => "show" })
  
  # UPDATE
  
  post("/modify_song/:path_id", { :controller => "songs", :action => "update" })
  
  # DELETE
  get("/delete_song/:path_id", { :controller => "songs", :action => "destroy" })

  #------------------------------

  # Routes for the Playlist resource:

  # CREATE
  post("/insert_playlist", { :controller => "playlists", :action => "create" })
          
  # READ
  get("/playlists", { :controller => "playlists", :action => "index" })
  
  get("/playlists/:path_id", { :controller => "playlists", :action => "show" })
  
  # UPDATE
  
  post("/modify_playlist/:path_id", { :controller => "playlists", :action => "update" })
  
  # DELETE
  get("/delete_playlist/:path_id", { :controller => "playlists", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
