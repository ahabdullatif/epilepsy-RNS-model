%% Line Length Detection Tool
% hit = 1 -> seizure detected
% hit = 0 -> no seizure
% average will weight most recent ecog data more heavily
% ecog should be a short snippet of the total ecog data

function [hit, prevLen] = lineLength(ecog,dt,prevLen)

% dy -> diff(ecog)
% dx -> dt
% dLen -> c^2 = a^2 + b^2
dLen = sqrt( (diff(ecog).^2 + dt^2 )); % pythagorean distance

totLen = sum(dLen);

if totLen > 6*prevLen % modify to change relative threshold
    hit = 1;
else
    hit = 0;
    prevLen = (totLen + prevLen)/2;
end

end

