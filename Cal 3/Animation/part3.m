%construct letter L
x = [0,4,4,2,2,0,0];
y = [0,0,2,2,6,6,0];
z = [0,0,0,0,0,0,0];
L = [x-2;y-3;z];

%construct letter I
x2 = [16,22,22,20,20,22,22,16,16,18,18,16,16];
y2 = [0,0,2,2,4,4,6,6,4,4,2,2,0];
z2 = [0,0,0,0,0,0,0,0,0,0,0,0,0];
I = [x2-19;y2-3;z2];

%construct letter T
x3 = [32,34,34,36,36,30,30,32,32];
y3 = [0,0,4,4,6,6,4,4,0];
z3 = [0,0,0,0,0,0,0,0,0];
T = [x3-33;y3-3;z3];

for(i = 0:1:120)
    theta = i * (pi/20);
    Zm = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0;0 0 1];
    
    beta = i * (pi/30);
    Ym = [cos(beta) 0 sin(beta); 0 1 0; -sin(beta) 0 cos(beta)];
    
    alpha = i * (pi/12);
    Xm = [1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)];
    
    Rl = Zm * L;
    Nx = Rl(1,:);
    Ny = Rl(2,:);
    Nz = Rl(3,:);
    
    Rl2 = Ym * I;
    Nx2 = Rl2(1,:);
    Ny2 = Rl2(2,:);
    Nz2 = Rl2(3,:);
    
    Rl3 = Xm * T;
    Nx3 = Rl3(1,:);
    Ny3 = Rl3(2,:);
    Nz3 = Rl3(3,:);

    
    line(Nx+2, Ny+3, Nz)
    line(Nx2+19, Ny2+3, Nz2)
    line(Nx3+33, Ny3+3, Nz3)
    pause(1/24);
    clf;
end