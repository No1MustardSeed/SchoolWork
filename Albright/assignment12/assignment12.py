
#14-1
    #Fisrt I added the elif statement to check if the P key is pressed
        #elif event.key == pygame.K_p and not self.game_active:""
            #self._start_game()""
    
    #Since the check play button function is the only place where the game starts
    #I made a new functions so that the start game can be separate from just the button(I hope that makes sense)
    #Therefore the check play button function just calls the start game function when the button is clicked
    #and the rest of the start game fusntions were moved to the new class
        #def _check_play_button(self, mouse_pos):
            #button_clicked = self.play_button.rect.collidepoint(mouse_pos)
            #if button_clicked and not self.game_active:
                #self._start_game()
        
        #def _start_game(self):
            #"""Start a new game."""
            #self.settings.initialize_dynamic_settings()

            #self.stats.reset_stats()
            #self.sb.prep_score()
            #self.sb.prep_level()
            #self.sb.prep_ships()
            #self.game_active = True

            #self.bullets.empty()
            #self.aliens.empty()

            #self._create_fleet()
            #self.ship.center_ship()

            #pygame.mouse.set_visible(False)
    #I also changed the message on the play button to tell the player 
    #they can also press P to start the game
     # Make the Play button.
        #self.play_button = Button(self, "Play or press P")

#14-5
    #in the game stats class
    #added code to read high score and if there is none, it is zero to avoid crashes
        #try:
        #    with open("high_score.txt") as f:
        #        self.high_score = int(f.read())
        #except FileNotFoundError:
        #    self.high_score = 0

    #added this to alien invasion class
       # def _save_high_score_and_exit(self):
       #     with open("high_score.txt", "w") as f:
       #         f.write(str(self.stats.high_score))
       #     sys.exit()

    #the changes below replace the sys.exit() calls to account ofor the highscore

    #and replaced pygame quit even with this in def events
        #if event.type == pygame.QUIT:
        #    self._save_high_score_and_exit()

    #in def  check keydown events replaces
        #elif event.key == pygame.K_q:
            #sys.exit()

        #with 

        #elif event.key == pygame.K_q:
            #self._save_high_score_and_exit()
