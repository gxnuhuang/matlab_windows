
fprintf('hello\n');

myworld = vrworld('my3danimation')
open(myworld)
view(myworld);
vrdrawnow;
nodes(myworld)
mynodes = get(myworld, 'Nodes')
z1 = -1:0.1:1
x1 = 3 + zeros(size(z1))
y1 = 0.25 + zeros(size(z1))
for i=1:length(x1)
    myworld.B1.rotation = [1 1 z1(i) z1(i)];
    vrdrawnow;
    pause(0.1);
end

%myworld.B1.translation = [15 0.25 20];
