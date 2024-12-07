function S = Multi_vector(z,p)
%% brief: slide 6.2 geometric jacobian
% mutil two vector
x(1) = -z(3)*p(2) + z(2)*p(3);
x(2) = z(3)*p(1) + z(1)*p(3);
x(3) = -z(2)*p(1) + z(1)*p(2);
S = [x(1);x(2);x(3)];
end