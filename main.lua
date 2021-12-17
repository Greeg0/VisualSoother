function love.load()
	winx = 800
	winy = 600
	love.window.setMode(winx, winy)
	posx = 300
	posy = 300
	x = 200
	y = x
	co = 1
	dvdImg=love.graphics.newImage('dvd.png')
	dvd={}
	dvd.image=dvdImg
	dvd.height=dvdImg:getHeight()
	dvd.width=dvdImg:getWidth()
	
	colour={ 
		{0.5, 0, 0} ,--Maroon
		{0, 0.5, 0} ,--Green
		{0.5, 0.5, 0} ,--Olive
		{0, 0, 0.5} ,--Royal
		{0.5, 0, 0.5} ,--Purple
		{0, 0.5, 0.5} ,--Teal
		{0.5, 0.5, 0.5} ,--Gray
		{1, 0, 0} ,--Red
		{0, 1, 0} ,--Lime
		{1, 1, 0} ,--Yellow
		{0.75, 0.75, 0.75} ,--Silver
		{0, 0, 1} ,--Blue
		{1, 0, 1} ,--Pink
		{0, 1, 1} ,--Cyan
		{1, 1, 1} --White
		}	
end



function collides(pos, win, rect)
	return pos+rect>win or pos<0
end



function push(a, pos, win, rect) --for the fix of delta time messing with collision, now also includes the colour advance code.
		
		if co==15 then co=0 end
		co=co+1
		
		if a>0 then
			pos=0 else
			pos=win-rect
			
	end
	return pos
end





function love.update(dt)
    
    --Move it move it!
    posx = posx + x*dt
    posy = posy + y*dt
  
    --Collision detecting.
    
    if collides(posx, winx, dvd.width) then 
    	x=-x
    	posx=push(x, posx, winx, dvd.width)
    end
    		
    if collides(posy, winy, dvd.height) then 
    	y=-y
    	posy=push(y, posy, winy, dvd.height)
    end
    

    
    
end



function love.draw()
	love.graphics.setColor(colour[co][1], colour[co][2], colour[co][3])
	love.graphics.draw(dvd.image, posx, posy, 0)
end
