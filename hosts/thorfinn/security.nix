{...}: {
   security.pam.services.hyprlock = {
   name = "hyprlock";
   text = ''
     auth include login
   '';
   };
}
