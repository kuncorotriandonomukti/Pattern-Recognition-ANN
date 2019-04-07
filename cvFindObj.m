function cvFindObj(c,x,p)
citra = c;
pola = p;
x = bwareaopen(x,300);
x = logical(x);
% x = imread('Pola/7939.JPG');
% x = im2bw(x);
% Label all the connected components in the image.
label = bwlabel(x, 8);

% Here we do the image blob analysis.
% We get a set of properties for each labeled region.
objek = regionprops(label, 'BoundingBox', 'Centroid');
centroids = cat(2, objek.Centroid);

% Display the image
imshow(citra)

hold on
%This is a loop to bound the blue objects in a rectangular box.
for n = 1:length(objek)
    rectangle('Position',objek(n).BoundingBox,'EdgeColor','g','LineWidth',2)
    plot(centroids(:,1),centroids(:,2), '-m+')
    txt = text(centroids(:,1)+15, centroids(:,2),sprintf('%s', pola));
    set(txt, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'green');
end

hold off
drawnow;
end
