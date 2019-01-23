function RubiksCube()

global fig;
global elon;
global azim;
global cmenu;

c = [[1,1,1]; [1,0,0]; [0,0,1]; [1,0.6,0]; [0,1,0]; [1,1,0]];

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

    function main()
        fig = figure('Name','Rubiks Cube','NumberTitle','off','MenuBar','none');
        elon = get_elon_ui();
        azim = get_azim_ui();
        
        ui_setup();
        cmenu = generate_and_patch_ui_menu();
        
        pause(10);
        main_loop();
    end

    function ui_setup()
        uicontrol('Style', 'text', 'Position', [130 20 60 20], 'String', 'elongation');
        uicontrol('Style', 'text', 'Position', [130 40 50 20], 'String', 'azimuth');
        rotate_view();
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
        view(get(elon, 'Value')*360, get(azim, 'Value')*180-90);
    end

    function generate_centerpieces()
        patch([1,2,2,1],[2,2,1,1],[3,3,3,3],'w');
        patch([1,2,2,1],[0,0,0,0],[2,2,1,1],'r');
        patch([3,3,3,3],[1,2,2,1],[2,2,1,1],'b');
        patch([2,1,1,2],[3,3,3,3],[2,2,1,1],[1,0.6,0]);
        patch([0,0,0,0],[2,1,1,2],[2,2,1,1],'g');
        patch([1,2,2,1],[1,1,2,2],[0,0,0,0],'y');
    end

    function cmenu=generate_and_patch_ui_menu()
        for i = 1:6
            for j = 1:8
                cmenu(i, j) = generate_single_ui_menu(i, j);
            end
        end
        update_patches(cmenu);
    end

    function cmenu=generate_single_ui_menu(i, j)
        cmenu = uicontextmenu;
        uimenu(cmenu, 'Label', 'white', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(cmenu, 'Label', 'red', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(cmenu, 'Label', 'blue', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(cmenu, 'Label', 'orange', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(cmenu, 'Label', 'green', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(cmenu, 'Label', 'yellow', 'Callback', @change_color, 'UserData', [i j]);
    end

    function change_color(source, ~)
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
        update_single_patch(cmenu, i, j);
        refresh;
    end









    function main_loop()
        turn(1)
        turn(1)
        turn(5)
        turn(5)
        turn(3)
        turn(3)
        turn(7)
        turn(7)
        turn(9)
        turn(9)
        turn(11)
        turn(11)
    end






    function turn(dir)
        % R, R', U, U', L, L', D, D', F, F', B, B'
        for i = 0:1
            arrs(i+1) = patch(arrows(dir, (1+9*i):(3+9*i)), arrows(dir, (4+9*i):(6+9*i)), arrows(dir, (7+9*i):(9+9*i)), [0.5 0.1 0.5]);
        end
        pause(1);
        switch dir
            case 1
                turn_r();
            case 2
                reverse_turn_r();
            case 3
                turn_u();
            case 4
                reverse_turn_u();
            case 5
                turn_l();
            case 6
                reverse_turn_l();
            case 7
                turn_d();
            case 8
                reverse_turn_d();
            case 9
                turn_f();
            case 10
                reverse_turn_f();
            case 11
                turn_b();
            case 12
                reverse_turn_b();
        end
        update_patches(cmenu);
        hide_arrows(arrs);
        refresh;
    end

    function turn_r()
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
    end

    function reverse_turn_r()
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
    end

    function turn_u()
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
    end

    function reverse_turn_u()
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

    function turn_l()
        buf1 = w(1, 1, :);
        buf2 = w(1, 7:8, :);
        w(1, 1, :) = w(4, 5, :);
        w(1, 7:8, :) = w(4, 3:4, :);
        w(4, 5, :) = w(6, 1, :);
        w(4, 3:4, :) = w(6, 7:8, :);
        w(6, 1, :) = w(2, 1, :);
        w(6, 7:8, :) = w(2, 7:8, :);
        w(2, 1, :) = buf1;
        w(2, 7:8, :) = buf2;
        for i = 1:2
            buf = w(5,8,:);
            for i = 8:-1:2
                w(5,i,:) = w(5,i-1,:);
            end
            w(5,1,:) = buf;
        end
    end

    function reverse_turn_l()
        buf1 = w(1, 1, :);
        buf2 = w(1, 7:8, :);
        w(1, 1, :) = w(2, 1, :);
        w(1, 7:8, :) = w(2, 7:8, :);
        w(2, 1, :) = w(6, 1, :);
        w(2, 7:8, :) = w(6, 7:8, :);
        w(6, 1, :) = w(4, 5, :);
        w(6, 7:8, :) = w(4, 3:4, :);
        w(4, 5, :) = buf1;
        w(4, 3:4, :) = buf2;
        for j = 1:2
            buf = w(5,1,:);
            for i = 1:7
                w(5,i,:) = w(5,i+1,:);
            end
            w(5,8,:) = buf;
        end
    end

    function turn_d()
        buf = w(2, 5:7, :);
        w(2, 5:7, :) = w(5, 5:7, :);
        w(5, 5:7, :) = w(4, 5:7, :);
        w(4, 5:7, :) = w(3, 5:7, :);
        w(3, 5:7, :) = buf;
        for i = 1:2
            buf = w(6,8,:);
            for i = 8:-1:2
                w(6,i,:) = w(6,i-1,:);
            end
            w(6,1,:) = buf;
        end
    end

    function reverse_turn_d()
        buf = w(2, 5:7, :);
        w(2, 5:7, :) = w(3, 5:7, :);
        w(3, 5:7, :) = w(4, 5:7, :);
        w(4, 5:7, :) = w(5, 5:7, :);
        w(5, 5:7, :) = buf;
        for j = 1:2
            buf = w(6,1,:);
            for i = 1:7
                w(6,i,:) = w(6,i+1,:);
            end
            w(6,8,:) = buf;
        end
    end

    function turn_f()
        buf1 = w(1, 7, :);
        buf2 = w(1, 5:6, :);
        w(1, 5:7, :) = w(5, 3:5, :);
        w(5, 3:5, :) = w(6, 1:3, :);
        w(6, 1:2, :) = w(3, 7:8, :);
        w(6, 3, :) = w(3, 1, :);
        w(3, 1, :) = buf1;
        w(3, 7:8, :) = buf2;
        for i = 1:2
            buf = w(2,8,:);
            for i = 8:-1:2
                w(2,i,:) = w(2,i-1,:);
            end
            w(2,1,:) = buf;
        end
    end

    function reverse_turn_f()
        buf = w(1, 5:7, :);
        w(1, 7, :) = w(3, 1, :);
        w(1, 5:6, :) = w(3, 7:8, :);
        w(3, 1, :) = w(6,3,:);
        w(3,7:8,:) = w(6,1:2,:);
        w(6,1:3,:) = w(5,3:5,:);
        w(5,3:5,:) = buf;
        for j = 1:2
            buf = w(2,1,:);
            for i = 1:7
                w(2,i,:) = w(2,i+1,:);
            end
            w(2,8,:) = buf;
        end
    end

function turn_b()
        buf1 = w(1,1:2,:);
        buf2 = w(1,3,:);
        w(1,1:3,:) = w(3,3:5,:);
        w(3,3:5,:) = w(6,5:7,:);
        w(6,5:6,:) = w(5,7:8,:);
        w(6,7,:) = w(5,1,:);
        w(5,7:8,:) = buf1;
        w(5,1,:) = buf2;
        for i = 1:2
            buf = w(4,8,:);
            for i = 8:-1:2
                w(4,i,:) = w(4,i-1,:);
            end
            w(4,1,:) = buf;
        end
    end

    function reverse_turn_b()
        buf = w(1,1:3,:);
        w(1,3,:) = w(5,1,:);
        w(1,1:2,:) = w(5,7:8,:);
        w(5,1,:) = w(6,7,:);
        w(5,7:8,:) = w(6,5:6,:);
        w(6,5:7,:) = w(3,3:5,:);
        w(3,3:5,:) = buf;
        for j = 1:2
            buf = w(4,1,:);
            for i = 1:7
                w(4,i,:) = w(4,i+1,:);
            end
            w(4,8,:) = buf;
        end
    end






    function update_patches(cmenu)
        for i = 1:6
            for j = 1:8
                update_single_patch(cmenu, i, j);
            end
        end
    end

    function update_single_patch(cmenu, i, j)
        patch(pos(i,(12*j-11):(12*j-8)), pos(i,(12*j-7):(12*j-4)), pos(i,(12*j-3):(12*j)), w(i,j,:), 'UIContextMenu', cmenu(i,j), 'UserData', [i j]);
    end

    function hide_arrows(arrows)
        for i = 0:1
            arrows(i+1).Visible = 'Off';
        end
    end







main();

end
