function g = remove_shadow(f, gamma)
shadow = shadow_detection(f);
shadow = cast(shadow, 'uint8');
shadow = contraharmonic_filter(shadow, 5, 1.5);
fin(:,:,1) = (1 - shadow) .* f(:,:,1);
fin(:,:,2) = (1 - shadow) .* f(:,:,2);
fin(:,:,3) = (1 - shadow) .* f(:,:,3);
fout(:,:,1) = shadow .* f(:,:,1);
fout(:,:,2) = shadow .* f(:,:,2);
fout(:,:,3) = shadow .* f(:,:,3);
sumIN = reshape(sum(sum(fin )), 1, 3);
sumOUT = reshape(sum(sum(fout)), 1, 3);
aveIN = sumIN / sum(sum(1 - shadow));
aveOUT = sumOUT / sum(sum(shadow));
%c = aveOUT ./ aveIN;
c = (aveIN * aveOUT') / (aveIN * aveIN');
% fin(:,:,1) = gamma*c(1) * fin(:,:,1);
% fin(:,:,2) = gamma*c(2) * fin(:,:,2);
% fin(:,:,3) = gamma*c(3) * fin(:,:,3);
fin(:,:,1) = gamma*c * fin(:,:,1);
fin(:,:,2) = gamma*c * fin(:,:,2);
fin(:,:,3) = gamma*c * fin(:,:,3);
g = fin + fout;