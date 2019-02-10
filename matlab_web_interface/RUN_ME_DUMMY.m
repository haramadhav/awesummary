%%OM
%% MAIN loooper
function RUN_ME_DUMMY
try
while 1
  tic;
  get_put_test_dummy;
%   get_put_test2;
  toc;
  pause(1);
end
catch ME
  ME
end

% RUN_ME;
end