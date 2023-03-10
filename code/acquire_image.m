function im=acquire_image()
    global cam ;
    %cam = webcam("Microsoft* LifeCam Cinema(TM)");
    %cam = webcam(1);
    im = snapshot(cam);
end