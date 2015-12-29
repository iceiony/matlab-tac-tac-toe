function showwin(winninCells,game)
%Calcualtes the location of where an ellipse should be drawn .
%Then invokes the drawing

 p1 = winninCells(1,:);
 p2 = winninCells(end,:);
 
 [sizeX,sizeY] = size(game.OImg);
 
 %adjust indices to look good when drawing an ellipse
 if p1(1) < p2(1)
     p1(1) = p1(1) - 0.75;
     p2(1) = p2(1) - 0.25;
 elseif p1(1) > p2(1) 
     p1(1) = p1(1) - 0.25;
     p2(1) = p2(1) - 0.75;
 else
     p1(1) = p1(1) - 0.5;
     p2(1) = p2(1) - 0.5;
 end
 
  if p1(2) < p2(2)
     p1(2) = p1(2) - 0.75;
     p2(2) = p2(2) - 0.25;
 elseif p1(2) > p2(2) 
     p1(2) = p1(2) - 0.25;
     p2(2) = p2(2) - 0.75;
 else
     p1(2) = p1(2) - 0.5;
     p2(2) = p2(2) - 0.5;
 end
        
 
 drawellipse(p1(2) * sizeX , p1(1) * sizeY , p2(2) * sizeX , p2(1) * sizeY);
end