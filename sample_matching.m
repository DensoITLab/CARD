%% sample program
function sample_matching()

% setting path 
addpath('./toolbox');

th_ratio = 0.6;

% load image
img1 = imread('./images/book_img01.jpg');
img2 = imread('./images/book_img02.jpg');
img1 = rgb2gray(img1);
img2 = rgb2gray(img2);

% load configuration data
card_config_binary_ptr = card_config_load_mex('./config/card_config_128bit.bin');

% Extract CARD
tic;
[pnts_info1, desc1] = card_compact_and_realtime_descriptor_mex(img1, card_config_binary_ptr);
[pnts_info2, desc2] = card_compact_and_realtime_descriptor_mex(img2, card_config_binary_ptr);
t = toc / 2;
pnts1 = pnts_info1([1 2], :);
pnts2 = pnts_info2([1 2], :);

% matching
k = 2; % top k near neighbors
[idx, d] = hamming_enn_mex(desc1, desc2, k);
flag = (d(1,:) < (d(2,:) * th_ratio))';
match_idx(flag) = idx(1,flag)';

% display
appended_img = [img1 img2];
width = size(img1,2);

figure(1);
caption = sprintf('%f (msec)', t * 1000);
show_correspondence(appended_img, match_idx, pnts1, pnts2, width, caption);

% release configuration data
card_config_release_mex(card_config_binary_ptr);

end

%% show correspondence
function show_correspondence(two_img, match_idx, pnts1, pnts2, width, caption)

% image
imshow(two_img);
hold on;

% points
scatter([pnts1(1,:) pnts2(1,:)+width], [pnts1(2,:) pnts2(2,:)], '.');

% lines
flag = match_idx > 0;

x = [pnts1(1,flag); (pnts2(1,match_idx(flag))+width); nan(1, nnz(flag))];
y = [pnts1(2,flag);  pnts2(2,match_idx(flag));        nan(1, nnz(flag))];

line(x(:), y(:), 'Color', 'c');

num = nnz(flag);
title(sprintf('%s: Found %d matches.\n', caption, num));
hold off;

end