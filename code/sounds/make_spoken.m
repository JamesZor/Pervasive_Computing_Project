
[w,f]=get_spokenword("Say Yes,No or Reset",4);
sound(w,f);
audiowrite("synr.wav",w,f);
pause(4);

[w,f]=../get_spokenword("What is your name?",4);
sound(w,f);
audiowrite("wiyn.wav",w,f);
pause(4);

[w,f]=get_spokenword("Is your name ",4);
sound(w,f);
audiowrite("iyn.wav",w,f);
pause(4);

[w,f]=get_spokenword("please throw the dice",4);
sound(w,f);
audiowrite("pttd.wav",w,f);

[w,f]=get_spokenword("Hallo",4);
sound(w,f);
audiowrite("hallo.wav",w,f);
pause(4);

[w,f]=get_spokenword("Is there an other person",4);
sound(w,f);
audiowrite("itaop.wav",w,f);
pause(4)

[w,f]=get_spokenword("player one",4);
sound(w,f);
audiowrite("player1.wav",w,f);

[w,f]=get_spokenword("player two",4);
sound(w,f);
audiowrite("player2.wav",w,f);
