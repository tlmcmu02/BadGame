function endofdash()
    dashattack = 0
  end
  
  function ballCR()
  
    if Player1.FaceD == true then
        if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
            if cc(Player1.x, Player1.y + 32, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 32, Player1.y + 48, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
            if cc(Player1.x + 4, Player1.y + 43, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 49, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 18, Player1.y + 60, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 32 then
            if cc(Player1.x + 34, Player1.y + 47, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 48, Player1.y + 41, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
            if cc(Player1.x + 48, Player1.y + 41, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 49, Player1.y + 28, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 60, Player1.y + 28, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
            if cc(Player1.x + 49, Player1.y + 6, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 43, Player1.y + 6, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
            if cc(Player1.x + 49, Player1.y + 18, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 6, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 2, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
            if cc(Player1.x + 4, Player1.y + 4, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 19, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
        if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
            if cc(Player1.x, Player1.y + 19, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 5, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 15, Player1.y + 5, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
    end 
    if Player1.FaceR == true then
        if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
            if cc(Player1.x, Player1.y + 32, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 32, Player1.y + 48, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
            if cc(Player1.x + 4, Player1.y + 43, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 49, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 18, Player1.y + 60, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
            if cc(Player1.x + 34, Player1.y + 47, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 48, Player1.y + 41, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
            if cc(Player1.x + 48, Player1.y + 41, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 49, Player1.y + 28, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 60, Player1.y + 28, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 32 then
            if cc(Player1.x + 49, Player1.y + 6, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 43, Player1.y + 6, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
            if cc(Player1.x + 49, Player1.y + 18, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 6, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 2, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
            if cc(Player1.x + 4, Player1.y + 4, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 19, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
        if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
            if cc(Player1.x, Player1.y + 19, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 5, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 15, Player1.y + 5, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
    end 
    if Player1.FaceU == true then
        if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
            if cc(Player1.x, Player1.y + 32, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 32, Player1.y + 48, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
            if cc(Player1.x + 4, Player1.y + 43, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 49, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 18, Player1.y + 60, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
            if cc(Player1.x + 34, Player1.y + 47, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 48, Player1.y + 41, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
            if cc(Player1.x + 48, Player1.y + 41, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 49, Player1.y + 28, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 60, Player1.y + 28, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
            if cc(Player1.x + 49, Player1.y + 6, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 43, Player1.y + 6, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
            if cc(Player1.x + 49, Player1.y + 18, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 6, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 2, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 32 then
            if cc(Player1.x + 4, Player1.y + 4, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 19, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
        if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
            if cc(Player1.x, Player1.y + 19, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 5, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 15, Player1.y + 5, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
    end 
    if Player1.FaceL == true then
        if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 32 then
            if cc(Player1.x, Player1.y + 32, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 32, Player1.y + 48, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
            if cc(Player1.x + 4, Player1.y + 43, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 49, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 18, Player1.y + 60, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SE'
            end
        end
        if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
            if cc(Player1.x + 34, Player1.y + 47, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 48, Player1.y + 41, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
            if cc(Player1.x + 48, Player1.y + 41, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 49, Player1.y + 28, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 60, Player1.y + 28, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NE'
            end
        end
        if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
            if cc(Player1.x + 49, Player1.y + 6, 32, 27, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 43, Player1.y + 6, 7, 12, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
            if cc(Player1.x + 49, Player1.y + 18, 13, 7, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 6, 34, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 28, Player1.y + 2, 20, 5, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'NW'
            end
        end
        if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
            if cc(Player1.x + 4, Player1.y + 4, 27, 32, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 19, 12, 7, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
        if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
            if cc(Player1.x, Player1.y + 19, 7, 13, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 4, Player1.y + 5, 13, 34, ball1.x, ball1.y, 32, 32) or cc(Player1.x + 15, Player1.y + 5, 5, 20, ball1.x, ball1.y, 32, 32) then
                ball1.direction = 'SW'
            end
        end
    end
  
  end
  
  
       function CR()
  
          for i = 1, #bullet do 
  
          if Player1.FaceD == true then
              if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                  if cc(Player1.x, Player1.y + 32, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'S'
                  end
              end
              if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                  if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SE'
                  end
              end
              if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                  if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'E'
                  end
              end
              if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                  if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NE'
                  end
              end
              if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                  if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'N'
                  end
              end
              if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                  if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NW'
                  end
              end
              if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                  if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'W'
                  end
              end
              if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                  if cc(Player1.x, Player1.y + 19, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SW'
                  end
              end
          end 
          if Player1.FaceR == true then
              if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                  if cc(Player1.x, Player1.y + 32, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'S'
                  end
              end
              if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                  if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SE'
                  end
              end
              if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                  if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'E'
                  end
              end
              if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                  if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NE'
                  end
              end
              if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                  if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'N'
                  end
              end
              if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                  if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NW'
                  end
              end
              if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                  if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'W'
                  end
              end
              if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                  if cc(Player1.x, Player1.y + 19, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SW'
                  end
              end
          end 
          if Player1.FaceU == true then
              if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                  if cc(Player1.x, Player1.y + 32, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'S'
                  end
              end
              if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                  if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SE'
                  end
              end
              if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                  if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'E'
                  end
              end
              if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                  if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NE'
                  end
              end
              if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                  if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'N'
                  end
              end
              if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                  if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NW'
                  end
              end
              if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                  if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'W'
                  end
              end
              if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                  if cc(Player1.x, Player1.y + 19, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SW'
                  end
              end
          end 
          if Player1.FaceL == true then
              if Player1.animtimer == 18 or Player1.animtimer == 17 or Player1.animtimer == 16 then
                  if cc(Player1.x, Player1.y + 32, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 16, Player1.y + 48, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'S'
                  end
              end
              if Player1.animtimer == 15 or Player1.animtimer == 14 or Player1.animtimer == 13 then
                  if cc(Player1.x + 4, Player1.y + 43, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 49, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 18, Player1.y + 60, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SE'
                  end
              end
              if Player1.animtimer == 12 or Player1.animtimer == 11 or Player1.animtimer == 10 then
                  if cc(Player1.x + 34, Player1.y + 47, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 48, Player1.y + 41, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'E'
                  end
              end
              if Player1.animtimer == 9 or Player1.animtimer == 8 or Player1.animtimer == 7 then
                  if cc(Player1.x + 48, Player1.y + 41, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 49, Player1.y + 28, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 60, Player1.y + 28, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NE'
                  end
              end
              if Player1.animtimer == 6 or Player1.animtimer == 5 or Player1.animtimer == 4 then
                  if cc(Player1.x + 49, Player1.y + 6, 16, 27, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 43, Player1.y + 6, 7, 12, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'N'
                  end
              end
              if Player1.animtimer == 3 or Player1.animtimer == 2 or Player1.animtimer == 1 then
                  if cc(Player1.x + 49, Player1.y + 18, 13, 7, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 6, 34, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 28, Player1.y + 2, 20, 5, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'NW'
                  end
              end
              if Player1.animtimer == 24 or Player1.animtimer == 23 or Player1.animtimer == 22 then
                  if cc(Player1.x + 4, Player1.y + 4, 27, 16, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 19, 12, 7, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'W'
                  end
              end
              if Player1.animtimer == 21 or Player1.animtimer == 20 or Player1.animtimer == 19 then
                  if cc(Player1.x, Player1.y + 19, 7, 13, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 4, Player1.y + 5, 13, 34, bullet[i].x, bullet[i].y, 16, 16) or cc(Player1.x + 15, Player1.y + 5, 5, 20, bullet[i].x, bullet[i].y, 16, 16) then
                      bullet[i].direction = 'SW'
                  end
              end
          end
  
        end
  
   end
  
  
  function ballreflect()
  
  for i = 1, 5 do
  for t = 1, 10 do
  
  if ball1.direction == 'SW' then
    if mapc:cc(ball1.x - 3, ball1.y, 32, 32) == true then  
      ball1.direction = 'SE' 
    elseif mapc:cc(ball1.x, ball1.y + 6, 32, 32) == true then   
      ball1.direction = 'NW'
    elseif cc(ball1.x - 3, ball1.y, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'SE'
      block[i][t]:destroy()
    elseif cc(ball1.x, ball1.y + 6, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'NW'
      block[i][t]:destroy()
    end
  end
  
  if ball1.direction == 'SE' then
    if mapc:cc(ball1.x + 6, ball1.y, 32, 32) == true then  
      ball1.direction = 'SW' 
    elseif mapc:cc(ball1.x, ball1.y + 6, 32, 32) == true then   
      ball1.direction = 'NE'  
    elseif cc(ball1.x + 6, ball1.y, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'SW'
      block[i][t]:destroy()
    elseif cc(ball1.x, ball1.y + 6, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'NE'
      block[i][t]:destroy()
    end
  end
  
  if ball1.direction == 'NW' then
    if mapc:cc(ball1.x - 3, ball1.y, 32, 32) == true then  
      ball1.direction = 'NE' 
    elseif mapc:cc(ball1.x, ball1.y - 3, 32, 32) == true then   
      ball1.direction = 'SW' 
    elseif cc(ball1.x - 3, ball1.y, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'NE'
      block[i][t]:destroy()
    elseif cc(ball1.x, ball1.y - 3, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'SW'
      block[i][t]:destroy()
    end
  end
  
  if ball1.direction == 'NE' then
    if mapc:cc(ball1.x + 6, ball1.y, 32, 32) == true then   
      ball1.direction = 'NW'
    elseif mapc:cc(ball1.x, ball1.y - 3, 32, 32) == true then   
      ball1.direction = 'SE' 
    elseif cc(ball1.x + 6, ball1.y, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'NW'
      block[i][t]:destroy()
    elseif cc(ball1.x, ball1.y - 3, 32, 32, block[i][t].x, block[i][t].y, 64, 64) == true then 
      ball1.direction = 'SE'
      block[i][t]:destroy()
    end
  end
  
  end
  end
  
  end
  
  function bulletreflect()
  
    
  
    for p = 1, #bullet do 
    for i = 1, 5 do
    for t = 1, 10 do
  
    if bullet[p].cool == 0 then
    
    if bullet[p].direction == 'SWW' then
      if cc(bullet[p].x - 4.5, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then
        bullet[p].direction = 'SSE'
          bullet[p]:bounce()
    bullet[p].cool = 10 
      elseif cc(bullet[p].x, bullet[p].y + 1.5, 16, 16, 64, 704, 640, 64) == true then   
        bullet[p].direction = 'NNW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'SEE' then
      if cc(bullet[p].x + 4.5, bullet[p].y, 16, 16, 704, 64, 64, 640) == true then
        bullet[p].direction = 'SSW'
          bullet[p]:bounce()
    bullet[p].cool = 10 
      elseif cc(bullet[p].x, bullet[p].y + 1.5, 16, 16, 64, 704, 640, 64) == true then   
        bullet[p].direction = 'NNE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'NWW' then
      if cc(bullet[p].x - 4.5, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then
        bullet[p].direction = 'NNE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y - 1.5, 16, 16, 64, 0, 640, 64) == true then   
        bullet[p].direction = 'SSW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end 
    elseif bullet[p].direction == 'NEE' then
      if cc(bullet[p].x + 4.5, bullet[p].y, 16, 16, 704, 64, 64, 640) == true then
        bullet[p].direction = 'NNW'
          bullet[p]:bounce()
    bullet[p].cool = 10 
      elseif cc(bullet[p].x, bullet[p].y - 1.5, 16, 16, 64, 0, 640, 64) == true then   
        bullet[p].direction = 'SSE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'SSW' then
      if cc(bullet[p].x - 1.5, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then
        bullet[p].direction = 'SEE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y + 4.5, 16, 16, 64, 704, 640, 64) == true then   
        bullet[p].direction = 'NWW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'SSE' then
      if cc(bullet[p].x + 1.5, bullet[p].y, 16, 16, 704, 64, 64, 640) == true then
        bullet[p].direction = 'SWW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y + 4.5, 16, 16, 64, 704, 640, 64) == true then   
        bullet[p].direction = 'NEE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'NNW' then
      if cc(bullet[p].x - 1.5, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then
        bullet[p].direction = 'NEE'
          bullet[p]:bounce()
    bullet[p].cool = 10 
      elseif cc(bullet[p].x, bullet[p].y - 4.5, 16, 16, 64, 0, 640, 64) == true then   
        bullet[p].direction = 'SWW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'NNE' then
      if cc(bullet[p].x + 1.5, bullet[p].y, 16, 16, 704, 64, 64, 640) == true then
        bullet[p].direction = 'NWW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y - 4.5, 16, 16, 64, 0, 640, 64) == true then   
        bullet[p].direction = 'SEE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'SW' then
      if cc(bullet[p].x - 3, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then  
        bullet[p].direction = 'SE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y + 3, 16, 16, 64, 704, 640, 64) == true then   
        bullet[p].direction = 'NW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'SE' then
      if cc(bullet[p].x + 3, bullet[p].y, 16, 16, 704, 64, 64, 640) == true then  
        bullet[p].direction = 'SW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y + 3, 16, 16, 64, 704, 640, 64) == true then   
        bullet[p].direction = 'NE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'NW' then
      if cc(bullet[p].x - 3, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then  
        bullet[p].direction = 'NE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y - 3, 16, 16, 64, 0, 640, 64) == true then   
        bullet[p].direction = 'SW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'NE' then
      if cc(bullet[p].x + 3, bullet[p].y, 16, 16, 704, 64, 64, 640) == true then   
        bullet[p].direction = 'NW'
          bullet[p]:bounce()
    bullet[p].cool = 10
      elseif cc(bullet[p].x, bullet[p].y - 3, 16, 16, 64, 0, 640, 64) == true then   
        bullet[p].direction = 'SE'
          bullet[p]:bounce()
    bullet[p].cool = 10
      end  
    elseif bullet[p].direction == 'S' then
      if cc(bullet[p].x, bullet[p].y + 6, 16, 16, 64, 704, 640, 64) == true then  
        local n = love.math.random(1, 2)
        if n == 1 then
          bullet[p].direction = 'NNW'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
        if n == 2 then
          bullet[p].direction = 'NNE'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
      end  
    elseif bullet[p].direction == 'W' then
      if cc(bullet[p].x - 6, bullet[p].y, 16, 16, 0, 64, 64, 640) == true then  
        local n = love.math.random(1, 2)
        if n == 1 then
          bullet[p].direction = 'NEE'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
        if n == 2 then
          bullet[p].direction = 'SEE'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
      end  
    elseif bullet[p].direction == 'N' then
      if cc(bullet[p].x, bullet[p].y - 6, 16, 16, 64, 0, 640, 64) == true then 
        local n = love.math.random(1, 2)
        if n == 1 then
          bullet[p].direction = 'SSW'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
        if n == 2 then
          bullet[p].direction = 'SSE'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
      end  
    elseif bullet[p].direction == 'E' then
      if cc(bullet[p].x + 6, bullet[p].y, 16, 16, 704, 64, 64, 640) == false then  
        local n = love.math.random(1, 2)
        if n == 1 then
          bullet[p].direction = 'NWW'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
        if n == 2 then
          bullet[p].direction = 'SWW'
            bullet[p]:bounce()
    bullet[p].cool = 10
        end
      end  
    end
  
    end
    
    end
    end
    end
    
    end
  
  
    
  function updashcc()
      if block[1][1].updashcollision == 0 then
      if block[1][2].updashcollision == 0 then
      if block[1][3].updashcollision == 0 then
      if block[1][4].updashcollision == 0 then
      if block[1][5].updashcollision == 0 then
      if block[1][6].updashcollision == 0 then
      if block[1][7].updashcollision == 0 then
      if block[1][8].updashcollision == 0 then
      if block[1][9].updashcollision == 0 then
      if block[1][10].updashcollision == 0 then
      if block[2][1].updashcollision == 0 then
      if block[2][2].updashcollision == 0 then
      if block[2][3].updashcollision == 0 then
      if block[2][4].updashcollision == 0 then
      if block[2][5].updashcollision == 0 then
      if block[2][6].updashcollision == 0 then
      if block[2][7].updashcollision == 0 then
      if block[2][8].updashcollision == 0 then
      if block[2][9].updashcollision == 0 then
      if block[2][10].updashcollision == 0 then
      if block[3][1].updashcollision == 0 then
      if block[3][2].updashcollision == 0 then
      if block[3][3].updashcollision == 0 then
      if block[3][4].updashcollision == 0 then
      if block[3][5].updashcollision == 0 then
      if block[3][6].updashcollision == 0 then
      if block[3][7].updashcollision == 0 then
      if block[3][8].updashcollision == 0 then
      if block[3][9].updashcollision == 0 then
      if block[3][10].updashcollision == 0 then
      if block[4][1].updashcollision == 0 then
      if block[4][2].updashcollision == 0 then
      if block[4][3].updashcollision == 0 then
      if block[4][4].updashcollision == 0 then
      if block[4][5].updashcollision == 0 then
      if block[4][6].updashcollision == 0 then
      if block[4][7].updashcollision == 0 then
      if block[4][8].updashcollision == 0 then
      if block[4][9].updashcollision == 0 then
      if block[4][10].updashcollision == 0 then
      if block[5][1].updashcollision == 0 then
      if block[5][2].updashcollision == 0 then
      if block[5][3].updashcollision == 0 then
      if block[5][4].updashcollision == 0 then
      if block[5][5].updashcollision == 0 then
      if block[5][6].updashcollision == 0 then
      if block[5][7].updashcollision == 0 then
      if block[5][8].updashcollision == 0 then
      if block[5][9].updashcollision == 0 then
      if block[5][10].updashcollision == 0 then
      if mapc:cc(Player1.x + 16 , Player1.y + 4, 32, 32) == false then   
        return true  
      else
      return false
      end 
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end 
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end 
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end 
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end 
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end
      else  
      return false
      end      
    end 
  end    
  
  
  function upcc()
    if block[1][1].upcollision == 0 then
    if block[1][2].upcollision == 0 then
    if block[1][3].upcollision == 0 then
    if block[1][4].upcollision == 0 then
    if block[1][5].upcollision == 0 then
    if block[1][6].upcollision == 0 then
    if block[1][7].upcollision == 0 then
    if block[1][8].upcollision == 0 then
    if block[1][9].upcollision == 0 then
    if block[1][10].upcollision == 0 then
    if block[2][1].upcollision == 0 then
    if block[2][2].upcollision == 0 then
    if block[2][3].upcollision == 0 then
    if block[2][4].upcollision == 0 then
    if block[2][5].upcollision == 0 then
    if block[2][6].upcollision == 0 then
    if block[2][7].upcollision == 0 then
    if block[2][8].upcollision == 0 then
    if block[2][9].upcollision == 0 then
    if block[2][10].upcollision == 0 then
    if block[3][1].upcollision == 0 then
    if block[3][2].upcollision == 0 then
    if block[3][3].upcollision == 0 then
    if block[3][4].upcollision == 0 then
    if block[3][5].upcollision == 0 then
    if block[3][6].upcollision == 0 then
    if block[3][7].upcollision == 0 then
    if block[3][8].upcollision == 0 then
    if block[3][9].upcollision == 0 then
    if block[3][10].upcollision == 0 then
    if block[4][1].upcollision == 0 then
    if block[4][2].upcollision == 0 then
    if block[4][3].upcollision == 0 then
    if block[4][4].upcollision == 0 then
    if block[4][5].upcollision == 0 then
    if block[4][6].upcollision == 0 then
    if block[4][7].upcollision == 0 then
    if block[4][8].upcollision == 0 then
    if block[4][9].upcollision == 0 then
    if block[4][10].upcollision == 0 then
    if block[5][1].upcollision == 0 then
    if block[5][2].upcollision == 0 then
    if block[5][3].upcollision == 0 then
    if block[5][4].upcollision == 0 then
    if block[5][5].upcollision == 0 then
    if block[5][6].upcollision == 0 then
    if block[5][7].upcollision == 0 then
    if block[5][8].upcollision == 0 then
    if block[5][9].upcollision == 0 then
    if block[5][10].upcollision == 0 then
    if mapc:cc(Player1.x + 16 , Player1.y + 10, 32, 32) == false then   
      return true  
    else
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end    
  
  function leftdashcc()
    if block[1][1].leftdashcollision == 0 then
    if block[1][2].leftdashcollision == 0 then
    if block[1][3].leftdashcollision == 0 then
    if block[1][4].leftdashcollision == 0 then
    if block[1][5].leftdashcollision == 0 then
    if block[1][6].leftdashcollision == 0 then
    if block[1][7].leftdashcollision == 0 then
    if block[1][8].leftdashcollision == 0 then
    if block[1][9].leftdashcollision == 0 then
    if block[1][10].leftdashcollision == 0 then
    if block[2][1].leftdashcollision == 0 then
    if block[2][2].leftdashcollision == 0 then
    if block[2][3].leftdashcollision == 0 then
    if block[2][4].leftdashcollision == 0 then
    if block[2][5].leftdashcollision == 0 then
    if block[2][6].leftdashcollision == 0 then
    if block[2][7].leftdashcollision == 0 then
    if block[2][8].leftdashcollision == 0 then
    if block[2][9].leftdashcollision == 0 then
    if block[2][10].leftdashcollision == 0 then
    if block[3][1].leftdashcollision == 0 then
    if block[3][2].leftdashcollision == 0 then
    if block[3][3].leftdashcollision == 0 then
    if block[3][4].leftdashcollision == 0 then
    if block[3][5].leftdashcollision == 0 then
    if block[3][6].leftdashcollision == 0 then
    if block[3][7].leftdashcollision == 0 then
    if block[3][8].leftdashcollision == 0 then
    if block[3][9].leftdashcollision == 0 then
    if block[3][10].leftdashcollision == 0 then
    if block[4][1].leftdashcollision == 0 then
    if block[4][2].leftdashcollision == 0 then
    if block[4][3].leftdashcollision == 0 then
    if block[4][4].leftdashcollision == 0 then
    if block[4][5].leftdashcollision == 0 then
    if block[4][6].leftdashcollision == 0 then
    if block[4][7].leftdashcollision == 0 then
    if block[4][8].leftdashcollision == 0 then
    if block[4][9].leftdashcollision == 0 then
    if block[4][10].leftdashcollision == 0 then
    if block[5][1].leftdashcollision == 0 then
    if block[5][2].leftdashcollision == 0 then
    if block[5][3].leftdashcollision == 0 then
    if block[5][4].leftdashcollision == 0 then
    if block[5][5].leftdashcollision == 0 then
    if block[5][6].leftdashcollision == 0 then
    if block[5][7].leftdashcollision == 0 then
    if block[5][8].leftdashcollision == 0 then
    if block[5][9].leftdashcollision == 0 then
    if block[5][10].leftdashcollision == 0 then
    if mapc:cc(Player1.x + 4, Player1.y + 16, 32, 32) == false then 
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end  
  
  function leftcc()
    if block[1][1].leftcollision == 0 then
    if block[1][2].leftcollision == 0 then
    if block[1][3].leftcollision == 0 then
    if block[1][4].leftcollision == 0 then
    if block[1][5].leftcollision == 0 then
    if block[1][6].leftcollision == 0 then
    if block[1][7].leftcollision == 0 then
    if block[1][8].leftcollision == 0 then
    if block[1][9].leftcollision == 0 then
    if block[1][10].leftcollision == 0 then
    if block[2][1].leftcollision == 0 then
    if block[2][2].leftcollision == 0 then
    if block[2][3].leftcollision == 0 then
    if block[2][4].leftcollision == 0 then
    if block[2][5].leftcollision == 0 then
    if block[2][6].leftcollision == 0 then
    if block[2][7].leftcollision == 0 then
    if block[2][8].leftcollision == 0 then
    if block[2][9].leftcollision == 0 then
    if block[2][10].leftcollision == 0 then
    if block[3][1].leftcollision == 0 then
    if block[3][2].leftcollision == 0 then
    if block[3][3].leftcollision == 0 then
    if block[3][4].leftcollision == 0 then
    if block[3][5].leftcollision == 0 then
    if block[3][6].leftcollision == 0 then
    if block[3][7].leftcollision == 0 then
    if block[3][8].leftcollision == 0 then
    if block[3][9].leftcollision == 0 then
    if block[3][10].leftcollision == 0 then
    if block[4][1].leftcollision == 0 then
    if block[4][2].leftcollision == 0 then
    if block[4][3].leftcollision == 0 then
    if block[4][4].leftcollision == 0 then
    if block[4][5].leftcollision == 0 then
    if block[4][6].leftcollision == 0 then
    if block[4][7].leftcollision == 0 then
    if block[4][8].leftcollision == 0 then
    if block[4][9].leftcollision == 0 then
    if block[4][10].leftcollision == 0 then
    if block[5][1].leftcollision == 0 then
    if block[5][2].leftcollision == 0 then
    if block[5][3].leftcollision == 0 then
    if block[5][4].leftcollision == 0 then
    if block[5][5].leftcollision == 0 then
    if block[5][6].leftcollision == 0 then
    if block[5][7].leftcollision == 0 then
    if block[5][8].leftcollision == 0 then
    if block[5][9].leftcollision == 0 then
    if block[5][10].leftcollision == 0 then
    if mapc:cc(Player1.x + 10, Player1.y + 16, 32, 32) == false then 
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end  
  
  function downdashcc()
    if block[1][1].downdashcollision == 0 then
    if block[1][2].downdashcollision == 0 then
    if block[1][3].downdashcollision == 0 then
    if block[1][4].downdashcollision == 0 then
    if block[1][5].downdashcollision == 0 then
    if block[1][6].downdashcollision == 0 then
    if block[1][7].downdashcollision == 0 then
    if block[1][8].downdashcollision == 0 then
    if block[1][9].downdashcollision == 0 then
    if block[1][10].downdashcollision == 0 then
    if block[2][1].downdashcollision == 0 then
    if block[2][2].downdashcollision == 0 then
    if block[2][3].downdashcollision == 0 then
    if block[2][4].downdashcollision == 0 then
    if block[2][5].downdashcollision == 0 then
    if block[2][6].downdashcollision == 0 then
    if block[2][7].downdashcollision == 0 then
    if block[2][8].downdashcollision == 0 then
    if block[2][9].downdashcollision == 0 then
    if block[2][10].downdashcollision == 0 then
    if block[3][1].downdashcollision == 0 then
    if block[3][2].downdashcollision == 0 then
    if block[3][3].downdashcollision == 0 then
    if block[3][4].downdashcollision == 0 then
    if block[3][5].downdashcollision == 0 then
    if block[3][6].downdashcollision == 0 then
    if block[3][7].downdashcollision == 0 then
    if block[3][8].downdashcollision == 0 then
    if block[3][9].downdashcollision == 0 then
    if block[3][10].downdashcollision == 0 then
    if block[4][1].downdashcollision == 0 then
    if block[4][2].downdashcollision == 0 then
    if block[4][3].downdashcollision == 0 then
    if block[4][4].downdashcollision == 0 then
    if block[4][5].downdashcollision == 0 then
    if block[4][6].downdashcollision == 0 then
    if block[4][7].downdashcollision == 0 then
    if block[4][8].downdashcollision == 0 then
    if block[4][9].downdashcollision == 0 then
    if block[4][10].downdashcollision == 0 then
    if block[5][1].downdashcollision == 0 then
    if block[5][2].downdashcollision == 0 then
    if block[5][3].downdashcollision == 0 then
    if block[5][4].downdashcollision == 0 then
    if block[5][5].downdashcollision == 0 then
    if block[5][6].downdashcollision == 0 then
    if block[5][7].downdashcollision == 0 then
    if block[5][8].downdashcollision == 0 then
    if block[5][9].downdashcollision == 0 then
    if block[5][10].downdashcollision == 0 then
    if mapc:cc(Player1.x + 16, Player1.y + 28, 32, 32) == false then 
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end  
  
  function downcc()
    if block[1][1].downcollision == 0 then
    if block[1][2].downcollision == 0 then
    if block[1][3].downcollision == 0 then
    if block[1][4].downcollision == 0 then
    if block[1][5].downcollision == 0 then
    if block[1][6].downcollision == 0 then
    if block[1][7].downcollision == 0 then
    if block[1][8].downcollision == 0 then
    if block[1][9].downcollision == 0 then
    if block[1][10].downcollision == 0 then
    if block[2][1].downcollision == 0 then
    if block[2][2].downcollision == 0 then
    if block[2][3].downcollision == 0 then
    if block[2][4].downcollision == 0 then
    if block[2][5].downcollision == 0 then
    if block[2][6].downcollision == 0 then
    if block[2][7].downcollision == 0 then
    if block[2][8].downcollision == 0 then
    if block[2][9].downcollision == 0 then
    if block[2][10].downcollision == 0 then
    if block[3][1].downcollision == 0 then
    if block[3][2].downcollision == 0 then
    if block[3][3].downcollision == 0 then
    if block[3][4].downcollision == 0 then
    if block[3][5].downcollision == 0 then
    if block[3][6].downcollision == 0 then
    if block[3][7].downcollision == 0 then
    if block[3][8].downcollision == 0 then
    if block[3][9].downcollision == 0 then
    if block[3][10].downcollision == 0 then
    if block[4][1].downcollision == 0 then
    if block[4][2].downcollision == 0 then
    if block[4][3].downcollision == 0 then
    if block[4][4].downcollision == 0 then
    if block[4][5].downcollision == 0 then
    if block[4][6].downcollision == 0 then
    if block[4][7].downcollision == 0 then
    if block[4][8].downcollision == 0 then
    if block[4][9].downcollision == 0 then
    if block[4][10].downcollision == 0 then
    if block[5][1].downcollision == 0 then
    if block[5][2].downcollision == 0 then
    if block[5][3].downcollision == 0 then
    if block[5][4].downcollision == 0 then
    if block[5][5].downcollision == 0 then
    if block[5][6].downcollision == 0 then
    if block[5][7].downcollision == 0 then
    if block[5][8].downcollision == 0 then
    if block[5][9].downcollision == 0 then
    if block[5][10].downcollision == 0 then
    if mapc:cc(Player1.x + 16, Player1.y + 22, 32, 32) == false then 
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end  
  
  
  function rightdashcc()
    if block[1][1].rightdashcollision == 0 then
    if block[1][2].rightdashcollision == 0 then
    if block[1][3].rightdashcollision == 0 then
    if block[1][4].rightdashcollision == 0 then
    if block[1][5].rightdashcollision == 0 then
    if block[1][6].rightdashcollision == 0 then
    if block[1][7].rightdashcollision == 0 then
    if block[1][8].rightdashcollision == 0 then
    if block[1][9].rightdashcollision == 0 then
    if block[1][10].rightdashcollision == 0 then
    if block[2][1].rightdashcollision == 0 then
    if block[2][2].rightdashcollision == 0 then
    if block[2][3].rightdashcollision == 0 then
    if block[2][4].rightdashcollision == 0 then
    if block[2][5].rightdashcollision == 0 then
    if block[2][6].rightdashcollision == 0 then
    if block[2][7].rightdashcollision == 0 then
    if block[2][8].rightdashcollision == 0 then
    if block[2][9].rightdashcollision == 0 then
    if block[2][10].rightdashcollision == 0 then
    if block[3][1].rightdashcollision == 0 then
    if block[3][2].rightdashcollision == 0 then
    if block[3][3].rightdashcollision == 0 then
    if block[3][4].rightdashcollision == 0 then
    if block[3][5].rightdashcollision == 0 then
    if block[3][6].rightdashcollision == 0 then
    if block[3][7].rightdashcollision == 0 then
    if block[3][8].rightdashcollision == 0 then
    if block[3][9].rightdashcollision == 0 then
    if block[3][10].rightdashcollision == 0 then
    if block[4][1].rightdashcollision == 0 then
    if block[4][2].rightdashcollision == 0 then
    if block[4][3].rightdashcollision == 0 then
    if block[4][4].rightdashcollision == 0 then
    if block[4][5].rightdashcollision == 0 then
    if block[4][6].rightdashcollision == 0 then
    if block[4][7].rightdashcollision == 0 then
    if block[4][8].rightdashcollision == 0 then
    if block[4][9].rightdashcollision == 0 then
    if block[4][10].rightdashcollision == 0 then
    if block[5][1].rightdashcollision == 0 then
    if block[5][2].rightdashcollision == 0 then
    if block[5][3].rightdashcollision == 0 then
    if block[5][4].rightdashcollision == 0 then
    if block[5][5].rightdashcollision == 0 then
    if block[5][6].rightdashcollision == 0 then
    if block[5][7].rightdashcollision == 0 then
    if block[5][8].rightdashcollision == 0 then
    if block[5][9].rightdashcollision == 0 then
    if block[5][10].rightdashcollision == 0 then
    if mapc:cc(Player1.x + 28, Player1.y + 16, 32, 32) == false then 
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end  
  
  function rightcc()
    if block[1][1].rightcollision == 0 then
    if block[1][2].rightcollision == 0 then
    if block[1][3].rightcollision == 0 then
    if block[1][4].rightcollision == 0 then
    if block[1][5].rightcollision == 0 then
    if block[1][6].rightcollision == 0 then
    if block[1][7].rightcollision == 0 then
    if block[1][8].rightcollision == 0 then
    if block[1][9].rightcollision == 0 then
    if block[1][10].rightcollision == 0 then
    if block[2][1].rightcollision == 0 then
    if block[2][2].rightcollision == 0 then
    if block[2][3].rightcollision == 0 then
    if block[2][4].rightcollision == 0 then
    if block[2][5].rightcollision == 0 then
    if block[2][6].rightcollision == 0 then
    if block[2][7].rightcollision == 0 then
    if block[2][8].rightcollision == 0 then
    if block[2][9].rightcollision == 0 then
    if block[2][10].rightcollision == 0 then
    if block[3][1].rightcollision == 0 then
    if block[3][2].rightcollision == 0 then
    if block[3][3].rightcollision == 0 then
    if block[3][4].rightcollision == 0 then
    if block[3][5].rightcollision == 0 then
    if block[3][6].rightcollision == 0 then
    if block[3][7].rightcollision == 0 then
    if block[3][8].rightcollision == 0 then
    if block[3][9].rightcollision == 0 then
    if block[3][10].rightcollision == 0 then
    if block[4][1].rightcollision == 0 then
    if block[4][2].rightcollision == 0 then
    if block[4][3].rightcollision == 0 then
    if block[4][4].rightcollision == 0 then
    if block[4][5].rightcollision == 0 then
    if block[4][6].rightcollision == 0 then
    if block[4][7].rightcollision == 0 then
    if block[4][8].rightcollision == 0 then
    if block[4][9].rightcollision == 0 then
    if block[4][10].rightcollision == 0 then
    if block[5][1].rightcollision == 0 then
    if block[5][2].rightcollision == 0 then
    if block[5][3].rightcollision == 0 then
    if block[5][4].rightcollision == 0 then
    if block[5][5].rightcollision == 0 then
    if block[5][6].rightcollision == 0 then
    if block[5][7].rightcollision == 0 then
    if block[5][8].rightcollision == 0 then
    if block[5][9].rightcollision == 0 then
    if block[5][10].rightcollision == 0 then
    if mapc:cc(Player1.x + 22, Player1.y + 16, 32, 32) == false then 
      return true  
    else
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end 
  
  function NEcc()
    if block[1][1].NEcollision == 0 then
    if block[1][2].NEcollision == 0 then
    if block[1][3].NEcollision == 0 then
    if block[1][4].NEcollision == 0 then
    if block[1][5].NEcollision == 0 then
    if block[1][6].NEcollision == 0 then
    if block[1][7].NEcollision == 0 then
    if block[1][8].NEcollision == 0 then
    if block[1][9].NEcollision == 0 then
    if block[1][10].NEcollision == 0 then
    if block[2][1].NEcollision == 0 then
    if block[2][2].NEcollision == 0 then
    if block[2][3].NEcollision == 0 then
    if block[2][4].NEcollision == 0 then
    if block[2][5].NEcollision == 0 then
    if block[2][6].NEcollision == 0 then
    if block[2][7].NEcollision == 0 then
    if block[2][8].NEcollision == 0 then
    if block[2][9].NEcollision == 0 then
    if block[2][10].NEcollision == 0 then
    if block[3][1].NEcollision == 0 then
    if block[3][2].NEcollision == 0 then
    if block[3][3].NEcollision == 0 then
    if block[3][4].NEcollision == 0 then
    if block[3][5].NEcollision == 0 then
    if block[3][6].NEcollision == 0 then
    if block[3][7].NEcollision == 0 then
    if block[3][8].NEcollision == 0 then
    if block[3][9].NEcollision == 0 then
    if block[3][10].NEcollision == 0 then
    if block[4][1].NEcollision == 0 then
    if block[4][2].NEcollision == 0 then
    if block[4][3].NEcollision == 0 then
    if block[4][4].NEcollision == 0 then
    if block[4][5].NEcollision == 0 then
    if block[4][6].NEcollision == 0 then
    if block[4][7].NEcollision == 0 then
    if block[4][8].NEcollision == 0 then
    if block[4][9].NEcollision == 0 then
    if block[4][10].NEcollision == 0 then
    if block[5][1].NEcollision == 0 then
    if block[5][2].NEcollision == 0 then
    if block[5][3].NEcollision == 0 then
    if block[5][4].NEcollision == 0 then
    if block[5][5].NEcollision == 0 then
    if block[5][6].NEcollision == 0 then
    if block[5][7].NEcollision == 0 then
    if block[5][8].NEcollision == 0 then
    if block[5][9].NEcollision == 0 then
    if block[5][10].NEcollision == 0 then
      return true  
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end 
  
  function NWcc()
    if block[1][1].NWcollision == 0 then
    if block[1][2].NWcollision == 0 then
    if block[1][3].NWcollision == 0 then
    if block[1][4].NWcollision == 0 then
    if block[1][5].NWcollision == 0 then
    if block[1][6].NWcollision == 0 then
    if block[1][7].NWcollision == 0 then
    if block[1][8].NWcollision == 0 then
    if block[1][9].NWcollision == 0 then
    if block[1][10].NWcollision == 0 then
    if block[2][1].NWcollision == 0 then
    if block[2][2].NWcollision == 0 then
    if block[2][3].NWcollision == 0 then
    if block[2][4].NWcollision == 0 then
    if block[2][5].NWcollision == 0 then
    if block[2][6].NWcollision == 0 then
    if block[2][7].NWcollision == 0 then
    if block[2][8].NWcollision == 0 then
    if block[2][9].NWcollision == 0 then
    if block[2][10].NWcollision == 0 then
    if block[3][1].NWcollision == 0 then
    if block[3][2].NWcollision == 0 then
    if block[3][3].NWcollision == 0 then
    if block[3][4].NWcollision == 0 then
    if block[3][5].NWcollision == 0 then
    if block[3][6].NWcollision == 0 then
    if block[3][7].NWcollision == 0 then
    if block[3][8].NWcollision == 0 then
    if block[3][9].NWcollision == 0 then
    if block[3][10].NWcollision == 0 then
    if block[4][1].NWcollision == 0 then
    if block[4][2].NWcollision == 0 then
    if block[4][3].NWcollision == 0 then
    if block[4][4].NWcollision == 0 then
    if block[4][5].NWcollision == 0 then
    if block[4][6].NWcollision == 0 then
    if block[4][7].NWcollision == 0 then
    if block[4][8].NWcollision == 0 then
    if block[4][9].NWcollision == 0 then
    if block[4][10].NWcollision == 0 then
    if block[5][1].NWcollision == 0 then
    if block[5][2].NWcollision == 0 then
    if block[5][3].NWcollision == 0 then
    if block[5][4].NWcollision == 0 then
    if block[5][5].NWcollision == 0 then
    if block[5][6].NWcollision == 0 then
    if block[5][7].NWcollision == 0 then
    if block[5][8].NWcollision == 0 then
    if block[5][9].NWcollision == 0 then
    if block[5][10].NWcollision == 0 then
      return true  
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end 
  
  function SEcc()
    if block[1][1].SEcollision == 0 then
    if block[1][2].SEcollision == 0 then
    if block[1][3].SEcollision == 0 then
    if block[1][4].SEcollision == 0 then
    if block[1][5].SEcollision == 0 then
    if block[1][6].SEcollision == 0 then
    if block[1][7].SEcollision == 0 then
    if block[1][8].SEcollision == 0 then
    if block[1][9].SEcollision == 0 then
    if block[1][10].SEcollision == 0 then
    if block[2][1].SEcollision == 0 then
    if block[2][2].SEcollision == 0 then
    if block[2][3].SEcollision == 0 then
    if block[2][4].SEcollision == 0 then
    if block[2][5].SEcollision == 0 then
    if block[2][6].SEcollision == 0 then
    if block[2][7].SEcollision == 0 then
    if block[2][8].SEcollision == 0 then
    if block[2][9].SEcollision == 0 then
    if block[2][10].SEcollision == 0 then
    if block[3][1].SEcollision == 0 then
    if block[3][2].SEcollision == 0 then
    if block[3][3].SEcollision == 0 then
    if block[3][4].SEcollision == 0 then
    if block[3][5].SEcollision == 0 then
    if block[3][6].SEcollision == 0 then
    if block[3][7].SEcollision == 0 then
    if block[3][8].SEcollision == 0 then
    if block[3][9].SEcollision == 0 then
    if block[3][10].SEcollision == 0 then
    if block[4][1].SEcollision == 0 then
    if block[4][2].SEcollision == 0 then
    if block[4][3].SEcollision == 0 then
    if block[4][4].SEcollision == 0 then
    if block[4][5].SEcollision == 0 then
    if block[4][6].SEcollision == 0 then
    if block[4][7].SEcollision == 0 then
    if block[4][8].SEcollision == 0 then
    if block[4][9].SEcollision == 0 then
    if block[4][10].SEcollision == 0 then
    if block[5][1].SEcollision == 0 then
    if block[5][2].SEcollision == 0 then
    if block[5][3].SEcollision == 0 then
    if block[5][4].SEcollision == 0 then
    if block[5][5].SEcollision == 0 then
    if block[5][6].SEcollision == 0 then
    if block[5][7].SEcollision == 0 then
    if block[5][8].SEcollision == 0 then
    if block[5][9].SEcollision == 0 then
    if block[5][10].SEcollision == 0 then
      return true  
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end 
  
  function SWcc()
    if block[1][1].SWcollision == 0 then
    if block[1][2].SWcollision == 0 then
    if block[1][3].SWcollision == 0 then
    if block[1][4].SWcollision == 0 then
    if block[1][5].SWcollision == 0 then
    if block[1][6].SWcollision == 0 then
    if block[1][7].SWcollision == 0 then
    if block[1][8].SWcollision == 0 then
    if block[1][9].SWcollision == 0 then
    if block[1][10].SWcollision == 0 then
    if block[2][1].SWcollision == 0 then
    if block[2][2].SWcollision == 0 then
    if block[2][3].SWcollision == 0 then
    if block[2][4].SWcollision == 0 then
    if block[2][5].SWcollision == 0 then
    if block[2][6].SWcollision == 0 then
    if block[2][7].SWcollision == 0 then
    if block[2][8].SWcollision == 0 then
    if block[2][9].SWcollision == 0 then
    if block[2][10].SWcollision == 0 then
    if block[3][1].SWcollision == 0 then
    if block[3][2].SWcollision == 0 then
    if block[3][3].SWcollision == 0 then
    if block[3][4].SWcollision == 0 then
    if block[3][5].SWcollision == 0 then
    if block[3][6].SWcollision == 0 then
    if block[3][7].SWcollision == 0 then
    if block[3][8].SWcollision == 0 then
    if block[3][9].SWcollision == 0 then
    if block[3][10].SWcollision == 0 then
    if block[4][1].SWcollision == 0 then
    if block[4][2].SWcollision == 0 then
    if block[4][3].SWcollision == 0 then
    if block[4][4].SWcollision == 0 then
    if block[4][5].SWcollision == 0 then
    if block[4][6].SWcollision == 0 then
    if block[4][7].SWcollision == 0 then
    if block[4][8].SWcollision == 0 then
    if block[4][9].SWcollision == 0 then
    if block[4][10].SWcollision == 0 then
    if block[5][1].SWcollision == 0 then
    if block[5][2].SWcollision == 0 then
    if block[5][3].SWcollision == 0 then
    if block[5][4].SWcollision == 0 then
    if block[5][5].SWcollision == 0 then
    if block[5][6].SWcollision == 0 then
    if block[5][7].SWcollision == 0 then
    if block[5][8].SWcollision == 0 then
    if block[5][9].SWcollision == 0 then
    if block[5][10].SWcollision == 0 then
      return true  
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end 
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end
    else  
    return false
    end      
  end 
  end 
  
  