% 得到码距最短的码字
function interpret_msg = interpret_msg(in_msg, all_encoded_msgs, all_possible_msgs)
rs_distances = zeros(1, 512);
for i = 1:512
rs_distances(i) = rs_code_distance(in_msg, all_encoded_msgs(i, :));
end
min_distance = min(rs_distances);
index = find(rs_distances == min_distance);
interpret_msg = all_possible_msgs(index(1), :);
end

% 计算两个RS码的码距
function distance = rs_code_distance(code1, code2)
distance = 0;
for i = 1:7
temp = gf_distance(code1(i), code2(i));
distance = distance + temp;
end
end