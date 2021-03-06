%%%%%%%%%%%%%%%% D O   N O T   E D I T   M E %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LIB_PATH = sprintf('..%slib%s', filesep,filesep);                         %
addpath(LIB_PATH,'-end');                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dbg = true;

dbnm = pathos(strcat(DB_ROOT(LIB_PATH), 'gait/surveillance/'));
dbnm_64x64  = pathos('_db/64x64/');
dbnm_biskelet = pathos('_db/biskelet/');

DIR = dir(strcat(dbnm_64x64, '*.png'));
sz = length(DIR);

dip_initialise('silent');

for f = 1:sz,
    fprintf('kare %04d/%04d isleniyor ...\n', f, sz);

    imgnm = DIR(f).name;    
    bw = imread(strcat(dbnm_64x64, imgnm));
    
    %if length(dir(strcat(dbnm_biskelet, '*.png'))) < 1
        a = dip_image(bw);

        a = fillholes(a);
        a = bclosing(a,1,-1,1);
        a = fillholes(a);

        b = 1 - logical(a);
        [bws,I0,x,y,x1,y1,aa,bb]=div_skeleton_new(4,1,b,15);

    %    b = bskeleton(a,0,'natural');
    %    bws = logical(b);
    %
        imwrite(bws, strcat(dbnm_biskelet, imgnm));
    %else
    %    bws = imread(strcat(dbnm_iskelet, imgnm));
    %end    
    
    if dbg
        figure(1);
            subplot(121),   imshow(bw),        title('64x64');
            subplot(122),   imshow(bws),        title('iskelet');
        drawnow;
    end    

end