function love.load()
	rectw=100
	recth=100
	winx = 800
	winy = 600
	love.window.setMode(winx, winy)
	posx = 300
	posy = 300
	x = 200
	y = x
end


function collides(pos, win, rect)
	return pos+rect>win or pos<0
end



function push(a, pos, win, rect) --for the fix of delta time messing with collision
	if a>0 then
		pos=0 else
			pos=win-rect
	end
end





function love.update(dt)
    
    if collides(posx, winx, rectw) then 
    	x=-x
    	push(x, posx, winx, rectw)
    end
    
   -- while collides(posx, winx) do --sometimes reversing variable is not enough to resolve this due to delta time.
   -- posx = posx + x*dt
   -- end

    posx = posx + x*dt
		
    if collides(posy, winy, recth) then 
    	y=-y
    	push(y, posy, winy, recth)
    end
    
 --   while collides(posy, winy) do --sometimes reversing variable is not enough to resolve this due to delta time.
 --   posy = posy + y*dt
 --   end
	
    posy = posy + y*dt
     
print(posx, posy)
end



function love.draw()
	love.graphics.rectangle('fill', posx, posy, 100, 100)
end
