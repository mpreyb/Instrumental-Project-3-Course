sys = tf([0 0.8555 0.271],[1 0.3276 0.003408]);
rlocus(sys);

b = [0 0.8555 0.271];
a = [1 0.3276 0.003408];
[A,B,C,D] = tf2ss(b,a);

ctrb(A,B)
rank(ctrb(A,B))

obsv(A,C)
rank(obsv(A,C))