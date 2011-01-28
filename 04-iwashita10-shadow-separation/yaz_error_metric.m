function yaz_error_metric(metric, str, etiket)
% function yaz_error_metric(metric, str, etiket)

fprintf('%s metrigi icin SONUCLAR:\n', str);

fprintf('\tError:\n');
fprintf('\t%s: %.3f +- %.3f\n\t%s: %.3f +- %.3f\n\t%s: %.3f +- %.3f\n\n', ...
   char(etiket(1)), mean(metric(1,:)), std(metric(1,:)), ...
   char(etiket(2)), mean(metric(2,:)), std(metric(2,:)), ...
   char(etiket(3)), mean(metric(3,:)), std(metric(3,:)));

[mn, idx] = min(metric);
fprintf('\tENIYILER: toplam %d adet veri var...\n', length(err_ky));
fprintf('\t%s: %d, %s: %d, %s: %d\n\n', ...
        char(etiket(1)), length(find(idx == 1)), ...
        char(etiket(2)), length(find(idx == 2)), ...
        char(etiket(3)), length(find(idx == 3)));
