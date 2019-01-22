function RubiksCube()

% Farbreihenfolge: w,r,b,o,gr,ge
% Würfel halten, dass dich die rote Fläche anguckt, weiß oben, weiß und rot wie man sie sieht, für b,o,gr würfel drehen und für ge Würfel von Ausgangsposition nach oben kippen
% dann Flächenreihenfolge: ol, om, or, rm, ur, um, ul, lm

% mögliche Farben
c = [[1,1,1]; [1,0,0]; [0,0,1]; [1,0.6,0]; [0,1,0]; [1,1,0]];

% pos speichert mögliche Flächenositionen
pos = [[[0,1,1,0], [3,3,2,2], [3,3,3,3]],  [[1,2,2,1], [3,3,2,2], [3,3,3,3]], [[2,3,3,2],[3,3,2,2],[3,3,3,3]], [[2,3,3,2],[2,2,1,1],[3,3,3,3]], [[2,3,3,2],[1,1,0,0],[3,3,3,3]], [[1,2,2,1],[1,1,0,0],[3,3,3,3]], [[0,1,1,0],[1,1,0,0],[3,3,3,3]], [[0,1,1,0],[2,2,1,1],[3,3,3,3]]; % weiß
	   [[0,1,1,0], [0,0,0,0], [3,3,2,2]],  [[1,2,2,1], [0,0,0,0], [3,3,2,2]], [[2,3,3,2],[0,0,0,0],[3,3,2,2]], [[2,3,3,2],[0,0,0,0],[2,2,1,1]], [[2,3,3,2],[0,0,0,0],[1,1,0,0]], [[1,2,2,1],[0,0,0,0],[1,1,0,0]], [[0,1,1,0],[0,0,0,0],[1,1,0,0]], [[0,1,1,0],[0,0,0,0],[2,2,1,1]]; % rot
	   [[3,3,3,3], [0,1,1,0], [3,3,2,2]],  [[3,3,3,3], [1,2,2,1], [3,3,2,2]], [[3,3,3,3],[2,3,3,2],[3,3,2,2]], [[3,3,3,3],[2,3,3,2],[2,2,1,1]], [[3,3,3,3],[2,3,3,2],[1,1,0,0]], [[3,3,3,3],[1,2,2,1],[1,1,0,0]], [[3,3,3,3],[0,1,1,0],[1,1,0,0]], [[3,3,3,3],[0,1,1,0],[2,2,1,1]]; % blau
	   [[3,2,2,3], [3,3,3,3], [3,3,2,2]],  [[2,1,1,2], [3,3,3,3], [3,3,2,2]], [[1,0,0,1],[3,3,3,3],[3,3,2,2]], [[1,0,0,1],[3,3,3,3],[2,2,1,1]], [[1,0,0,1],[3,3,3,3],[1,1,0,0]], [[2,1,1,2],[3,3,3,3],[1,1,0,0]], [[3,2,2,3],[3,3,3,3],[1,1,0,0]], [[3,2,2,3],[3,3,3,3],[2,2,1,1]]; % orange
	   [[0,0,0,0], [3,2,2,3], [3,3,2,2]],  [[0,0,0,0], [2,1,1,2], [3,3,2,2]], [[0,0,0,0],[1,0,0,1],[3,3,2,2]], [[0,0,0,0],[1,0,0,1],[2,2,1,1]], [[0,0,0,0],[1,0,0,1],[1,1,0,0]], [[0,0,0,0],[2,1,1,2],[1,1,0,0]], [[0,0,0,0],[3,2,2,3],[1,1,0,0]], [[0,0,0,0],[3,2,2,3],[2,2,1,1]]; % grün
	   [[0,1,1,0], [0,0,1,1], [0,0,0,0]],  [[1,2,2,1], [0,0,1,1], [0,0,0,0]], [[2,3,3,2],[0,0,1,1],[0,0,0,0]], [[2,3,3,2],[1,1,2,2],[0,0,0,0]], [[2,3,3,2],[2,2,3,3],[0,0,0,0]], [[1,2,2,1],[2,2,3,3],[0,0,0,0]], [[0,1,1,0],[2,2,3,3],[0,0,0,0]], [[1,0,0,1],[1,1,2,2],[0,0,0,0]]];% weiß

arrows = [2.5,  2.1,  2.9,   1.9,  1.1,  1.1,   3.1, 3.1, 3.1,   2.5,  2.1,  2.9,  -0.1, -0.1, -0.1,   1.9, 1.1, 1.1; % R
          2.5,  2.9,  2.1,  -0.1, -0.1, -0.1,   1.1, 1.9, 1.9,   2.5,  2.9,  2.1,   1.1,  1.9,  1.9,   3.1, 3.1, 3.1; % R'
          1.1,  1.9,  1.9,  -0.1, -0.1, -0.1,   2.5, 2.1, 2.9,  -0.1, -0.1, -0.1,   1.9,  1.1,  1.1,   2.5, 2.1, 2.9; % U
         -0.1, -0.1, -0.1,   1.1,  1.9,  1.9,   2.5, 2.9, 2.1,   1.9,  1.1,  1.1,  -0.1, -0.1, -0.1,   2.5, 2.9, 2.1; % U'
          0.5,  0.9,  0.1,   1.1,  1.9,  1.9,   3.1, 3.1, 3.1,   0.5,  0.9,  0.1,  -0.1, -0.1, -0.1,   1.1, 1.9, 1.9; % L
          0.5,  0.1,  0.9,  -0.1, -0.1, -0.1,   1.9, 1.1, 1.1,   0.5,  0.1,  0.9,   1.9,  1.1,  1.1,   3.1, 3.1, 3.1; % L'
         -0.1, -0.1, -0.1,   1.1,  1.9,  1.9,   0.5, 0.9, 0.1,   1.9,  1.1,  1.1,  -0.1, -0.1, -0.1,   0.5, 0.9, 0.1; % D
          1.1,  1.9,  1.9,  -0.1, -0.1, -0.1,   0.5, 0.1, 0.9,  -0.1, -0.1, -0.1,   1.9,  1.1,  1.1,   0.5, 0.1, 0.9; % D'
         -0.1, -0.1, -0.1,   0.5,  0.9,  0.1,   1.9, 1.1, 1.1,   1.9,  1.1,  1.1,   0.5,  0.9,  0.1,   3.1, 3.1, 3.1; % F
          1.1,  1.9,  1.9,   0.5,  0.1,  0.9,   3.1, 3.1, 3.1,  -0.1, -0.1, -0.1,   0.5,  0.1,  0.9,   1.1, 1.9, 1.9; % F'
          1.1,  1.9,  1.9,   2.5,  2.1,  2.9,   3.1, 3.1, 3.1,  -0.1, -0.1, -0.1,   2.5,  2.1,  2.9,   1.1, 1.9, 1.9; % B
         -0.1, -0.1, -0.1,   2.5,  2.9,  2.1,   1.9, 1.1, 1.1,   1.9,  1.1,  1.1,   2.5,  2.9,  2.1,   3.1, 3.1, 3.1; % B'
         ];

w=[];
for i = 1:6
	for j = 1:8
		w(i,j,:) = c(i,:);
	end
end

% also z.B. sollte pos(1,1) die Eckpunke der oberen linken weißen Fläche geben, genauer gesagt [0,1,1,0] als x-Koordinaten, [3,3,2,2] als y und [3,3,3,3] als z
figure('Name','Rubiks Cube','NumberTitle','off','MenuBar','none');
elon = get_elon_ui();
azim = get_azim_ui();

ui_setup();

function ui_setup()
	uicontrol('Style', 'text', 'Position', [130 20 60 20], 'String', 'elongation');
	uicontrol('Style', 'text', 'Position', [130 40 50 20], 'String', 'azimuth');
	rotateview;
	axis off
	axis equal

	generate_centerpieces();
end

function e=get_elon_ui()
	e = uicontrol('Style', 'slider', 'Value', 0.9, 'Callback', @rotate_view, 'Position', [20 20 100 20]);
end

function a=get_azim_ui()
	a = uicontrol('Style', 'slider', 'Value', 0.625, 'Callback', @rotate_view, 'Position', [20 40 100 20]);
end

function rotate_view(~, ~)
   view([(elon.Value*360) (azim.Value*180-90)]);
end

function generate_centerpieces()
	patch([1,2,2,1],[2,2,1,1],[3,3,3,3],'w');
	patch([1,2,2,1],[0,0,0,0],[2,2,1,1],'r');
	patch([3,3,3,3],[1,2,2,1],[2,2,1,1],'b');
	patch([2,1,1,2],[3,3,3,3],[2,2,1,1],[1,0.6,0]);
	patch([0,0,0,0],[2,1,1,2],[2,2,1,1],'g');
	patch([1,2,2,1],[1,1,2,2],[0,0,0,0],'y');
end
% restliche Flächen
function ui_label_and_patch_items()
    for i = 1:6
        for j = 1:8
            cmenu(i, j) = ui_label_item(i, j);
            ui_label_generate_patch(cmenu, i, j);
        end
    end
end

function cmenu=ui_label_item(i, j)
	cmenu(i,j) = uicontextmenu;
	uimenu(cmenu(i,j), 'Label', 'white', 'Callback', @changeColor, 'UserData', [i j]);
	uimenu(cmenu(i,j), 'Label', 'red', 'Callback', @changeColor, 'UserData', [i j]);
	uimenu(cmenu(i,j), 'Label', 'blue', 'Callback', @changeColor, 'UserData', [i j]);
	uimenu(cmenu(i,j), 'Label', 'orange', 'Callback', @changeColor, 'UserData', [i j]);
	uimenu(cmenu(i,j), 'Label', 'green', 'Callback', @changeColor, 'UserData', [i j]);
	uimenu(cmenu(i,j), 'Label', 'yellow', 'Callback', @changeColor, 'UserData', [i j]);
end

function ui_label_generate_patch(cmenu, i, j)
	patch(pos(i,(12*j-11):(12*j-8)), pos(i,(12*j-7):(12*j-4)), pos(i,(12*j-3):(12*j)), w(i,j,:), 'UIContextMenu', cmenu(i,j), 'UserData', [i j]);
end

pause(10);
function main_loop()
	while true
	    turn(1);
	    single_frame_wait();
	    turn(3);
	    single_frame_wait();
	    turn(2);
	    single_frame_wait();
	    turn(4);
	    single_frame_wait();
	end
end

function single_frame_wait()
	pause(1);
end

	function changeColor(source, ~)
        i = source.UserData(1);
        j = source.UserData(2);
		switch source.Label
            case 'white'
                w(i,j,:) = c(1,:);
            case 'red'
                w(i,j,:) = c(2,:);
            case 'blue'
                w(i,j,:) = c(3,:);
            case 'orange'
                w(i,j,:) = c(4,:);
            case 'green'
                w(i,j,:) = c(5,:);
            case 'yellow'
                w(i,j,:) = c(6,:);
        end
        patch(pos(i,(12*j-11):(12*j-8)), pos(i,(12*j-7):(12*j-4)), pos(i,(12*j-3):(12*j)), w(i,j,:), 'UIContextMenu', cmenu(i,j), 'UserData', [i j]);
        refresh;
    end

    function turn(dir)
        % R, R', U, U', L, L', D, D', F, F', B, B'
        for i = 0:1
            arrs(i+1) = patch(arrows(dir, (1+9*i):(3+9*i)), arrows(dir, (4+9*i):(6+9*i)), arrows(dir, (7+9*i):(9+9*i)), [0.5 0.1 0.5]);
        end
        pause(1);
        switch dir
            case 1
                buf1 = w(1, 3, :);
                buf2 = w(1, 4, :);
                buf3 = w(1, 5, :);
                w(1, 3:5, :) = w(2, 3:5, :);
                w(2, 3:5, :) = w(6, 3:5, :);
                w(6, 3:4, :) = w(4, 7:8, :);
                w(6, 5, :) = w(4, 1, :);
                w(4, 7, :) = buf1;
                w(4, 8, :) = buf2;
                w(4, 1, :) = buf3;
                for j = 1:2
                buf = w(3,8,:);
                for i = 8:-1:2
                    w(3,i,:) = w(3,i-1,:);
                end
                w(3,1,:) = buf;
                end
            case 2
                buf = w(1, 3:5, :);
                w(1, 3:4, :) = w(4, 7:8, :);
                w(1, 5, :) = w(4, 1, :);
                w(4, 7:8, :) = w(6, 3:4, :);
                w(4, 1, :) = w(6, 5, :);
                w(6, 3:5, :) = w(2, 3:5, :);
                w(2, 3:5, :) = buf;
                for j = 1:2
                    buf = w(3,1,:);
                    for i = 1:7
                        w(3,i,:) = w(3,i+1,:);
                    end
                    w(3,8,:) = buf;
                end
            case 3
                buf = w(2, 1:3, :);
                for i = 2:4
                w(i, 1:3, :) = w(i+1, 1:3, :);
                end
                w(5, 1:3, :) = buf;
                for i = 1:2
                    buf = w(1,8,:);
                    for i = 8:-1:2
                        w(1,i,:) = w(1,i-1,:);
                    end
                    w(1,1,:) = buf;
                end
            case 4
                buf = w(5, 1:3, :);
                for i = 5:-1:3
                w(i, 1:3, :) = w(i-1, 1:3, :);
                end
                w(2, 1:3, :) = buf;
                for j = 1:2
                    buf = w(1,1,:);
                    for i = 1:7
                        w(1,i,:) = w(1,i+1,:);
                    end
                    w(1,8,:) = buf;
                end
        end
        for i = 1:6
            for j = 1:8
                patch(pos(i,(12*j-11):(12*j-8)), pos(i,(12*j-7):(12*j-4)), pos(i,(12*j-3):(12*j)), w(i,j,:), 'UIContextMenu', cmenu(i,j), 'UserData', [i j]);
            end
        end
        for i = 0:1
            arrs(i+1).Visible = 'Off';
        end
        refresh;
    end
end
