print("Hello World!!!!");
screen.init();

screen.touch(
	function (event, x, y)
	    if (x<115) and (y<90) then
			audio.play(math.random(6) .. ".mp3");
		end;
		if (x>125) and (y<90) then
			audio.play("diehard.mp3");
		end;
		if (x<115) and (y>105) and (y < 195) then
			audio.play("drum.mp3");
		end;
		if (x>125) and (y>105) and (y < 195) then
			audio.play("cello.mp3");
		end;

		if (x<125) and (y>205) then
			-- Leiser
			current_volume = audio.get_volume();
			if (current_volume > 1) then
				audio.set_volume(current_volume - 1);
				audio.play("beep.mp3");
				draw_volume_buttons();
			else
				audio.play("beeplow.mp3");
			end;
		end;
		if (x>125) and (y>205) then
			-- Lauter
			current_volume = audio.get_volume();
			if (current_volume < 6) then
				audio.set_volume(current_volume + 1);
				audio.play("beep.mp3");
				draw_volume_buttons();
			else
				audio.play("beeplow.mp3");
			end;
		end;
	end
);
audio.play("music.mp3");
audio.set_volume(5);


audio.play("beep.mp3");
watch_timer = timer.create(3000, function()
	audio.play("beep.mp3");
	screen.fill(5,5,115,90, 12111115);
	screen.fill(125,5,115,90, 13111115);
	screen.fill(5,100,115,90, 14111115);
	screen.fill(125,100,115,90, 15111115);
	draw_volume_buttons();
	screen.update();
	timer.delete(watch_timer);
end);

function draw_volume_buttons()
	screen.fill(5,200,115,35, audio.get_volume() * 1111115);
	screen.fill(125,200,115,35, audio.get_volume() * 1111115);
	screen.update();
end;

--screen.touch(
--	function (event) 
--		if event == 1 then 
--			audio.play("music.mp3");
--			screen.fill(40,40,160,160, 12177515);
--			screen.update 
--		end;
--	end;
--);