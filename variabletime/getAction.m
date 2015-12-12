function a = getAction(Q,state)

%meaning of actions 
%1 - up
% 2 = down

Q_sa = Q(state, :);
pd_explore = makedist('Bino','p' ,0.05);
explore = random(pd_explore);
if explore == 1  %explore randomly
    a = random('unid',2);
else
    [m,a] = max(Q_sa);
    a_rand = find(Q_sa == m);
    if length(a_rand) > 1;
        ind = random('unid',length(a_rand));
        a = a_rand(ind);
    end
end
end