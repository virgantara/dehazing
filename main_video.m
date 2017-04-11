
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.


% Open the rhino.avi demo movie that ships with MATLAB.
% First get the folder that it lives in.
folder = fileparts(which('Data\Kelud\video_kelud.asf')); % Determine where demo folder is (works with all versions).
% Pick one of the two demo movies shipped with the Image Processing Toolbox.
% Comment out the other one.
movieFullFileName = fullfile(folder, 'Data\Kelud\video_kelud.asf');
% movieFullFileName = fullfile(folder, 'traffic.avi');
% Check to see that it exists.
if ~exist(movieFullFileName, 'file')
	strErrorMessage = sprintf('File not found:\n%s\nYou can choose a new one, or cancel', movieFullFileName);
	response = questdlg(strErrorMessage, 'File not found', 'OK - choose a new movie.', 'Cancel', 'OK - choose a new movie.');
	if strcmpi(response, 'OK - choose a new movie.')
		[baseFileName, folderName, FilterIndex] = uigetfile('*.avi');
		if ~isequal(baseFileName, 0)
			movieFullFileName = fullfile(folderName, baseFileName);
		else
			return;
		end
	else
		return;
	end
end

try
	videoObject = VideoReader(movieFullFileName)
	% Determine how many frames there are.
	numberOfFrames = videoObject.NumberOfFrames;
	vidHeight = videoObject.Height;
	vidWidth = videoObject.Width;
	
	numberOfFramesWritten = 0;

    waktu = zeros(1,1);
	for frame = 1 : numberOfFrames
		% Extract the frame from the movie structure.
		thisFrame = read(videoObject, frame);
        
        thisFrame = imcrop(thisFrame,[0 30 800 450]);
        
%         src = im2double(thisFrame);
%         darkchannel = get_dark_channel(src,15);
%         A = get_atmosphere(src, darkchannel);
%         [height, width, nch] = size(src);
%         hsv = rgb2hsv(src);
%         d = zeros(height, width);
%         %d(:,:) = 0.121779 + 0.959710 * hsv(:,:,3) - 0.780245 * hsv(:,:,2) + 0.041337;
%         d(:,:) =  0.0910 + 0.6960 * hsv(:,:,3)  -0.7198 * hsv(:,:,2);
%         new_d = d;%d_patch(d, 5);
% 
%          r = 15;
%         res = 0.001;
% 
%         guidedfilter_d = guided_filter(rgb2gray(src), new_d, r, res);
%         
%         hsl = tmap(src,guidedfilter_d);
        frame
        tic
        our(thisFrame);
        waktu = [waktu; zeros(1,1)];
       waktu(frame) = toc;
%         if mod(frame,30) == 0
%             outputBaseFileName = sprintf('Frame %4.4d.jpg', frame);
%             iname = strcat('Data\Video Dehazed\',outputBaseFileName);
%             imwrite(hsl,iname);
%         end
        
	end

	
catch ME
	% Some error happened if you get here.
	strErrorMessage = sprintf('Error extracting movie frames from:\n\n%s\n\nError: %s\n\n)', movieFullFileName, ME.message);
	uiwait(msgbox(strErrorMessage));
end

