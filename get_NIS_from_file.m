function [radar_nis, laser_nis] = get_NIS_from_file(filename)
fid = fopen(filename);

tline = fgetl(fid);

radar_nis = [];
laser_nis = [];

while ischar(tline)
   matches = strfind(tline, 'Radar NIS = ');
   if ~isempty(matches)
       radar_nis = [radar_nis; str2double(tline(12:end))];
   end
   matches = strfind(tline, 'Laser NIS = ');
   if ~isempty(matches)
       laser_nis = [laser_nis; str2double(tline(12:end))];
   end
   tline = fgetl(fid);
end
fclose(fid);
end