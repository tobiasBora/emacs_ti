-- Ceci est un programme de test
-- Ti-mode="MyLibs"
i=0
timer.start(0.05) -- va déclencher la fonction on.timer toues les 0.5

function on.timer()
   if i < 180 then i=i+1 else timer.stop() end
   platform.window:invalidate()
end

function on.paint(gc)
   gc:setFont("sansserif", "b", 12)
   gc:setColorRGB(158, 5, 8)
   gc:drawString(i, 0, 20+i, "top")  -- (le top (optionnel) est l'alignement vertical par rapport à la coord y)
end



