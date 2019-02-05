function RubiksCube()

global fig;
global elon;
global azim;
global cmenu;
global text_error;
global text_solved;
global button_solve;
global turn_list;
global button_next;
global button_prev;
global solve_step;
global checkbox_arrows;
global rotation_buttons;
global text_not_solvable;
global button_group;


possible_colors = [[1,1,1]; [1,0,0]; [0,0,1]; [1,0.6,0]; [0,1,0]; [1,1,0]];

face_positions = [[[0,1,1,0], [3,3,2,2], [3,3,3,3]],  [[1,2,2,1], [3,3,2,2], [3,3,3,3]], [[2,3,3,2],[3,3,2,2],[3,3,3,3]], [[2,3,3,2],[2,2,1,1],[3,3,3,3]], [[2,3,3,2],[1,1,0,0],[3,3,3,3]], [[1,2,2,1],[1,1,0,0],[3,3,3,3]], [[0,1,1,0],[1,1,0,0],[3,3,3,3]], [[0,1,1,0],[2,2,1,1],[3,3,3,3]]; % white
    [[0,1,1,0], [0,0,0,0], [3,3,2,2]],  [[1,2,2,1], [0,0,0,0], [3,3,2,2]], [[2,3,3,2],[0,0,0,0],[3,3,2,2]], [[2,3,3,2],[0,0,0,0],[2,2,1,1]], [[2,3,3,2],[0,0,0,0],[1,1,0,0]], [[1,2,2,1],[0,0,0,0],[1,1,0,0]], [[0,1,1,0],[0,0,0,0],[1,1,0,0]], [[0,1,1,0],[0,0,0,0],[2,2,1,1]]; % red
    [[3,3,3,3], [0,1,1,0], [3,3,2,2]],  [[3,3,3,3], [1,2,2,1], [3,3,2,2]], [[3,3,3,3],[2,3,3,2],[3,3,2,2]], [[3,3,3,3],[2,3,3,2],[2,2,1,1]], [[3,3,3,3],[2,3,3,2],[1,1,0,0]], [[3,3,3,3],[1,2,2,1],[1,1,0,0]], [[3,3,3,3],[0,1,1,0],[1,1,0,0]], [[3,3,3,3],[0,1,1,0],[2,2,1,1]]; % blue
    [[3,2,2,3], [3,3,3,3], [3,3,2,2]],  [[2,1,1,2], [3,3,3,3], [3,3,2,2]], [[1,0,0,1],[3,3,3,3],[3,3,2,2]], [[1,0,0,1],[3,3,3,3],[2,2,1,1]], [[1,0,0,1],[3,3,3,3],[1,1,0,0]], [[2,1,1,2],[3,3,3,3],[1,1,0,0]], [[3,2,2,3],[3,3,3,3],[1,1,0,0]], [[3,2,2,3],[3,3,3,3],[2,2,1,1]]; % orange
    [[0,0,0,0], [3,2,2,3], [3,3,2,2]],  [[0,0,0,0], [2,1,1,2], [3,3,2,2]], [[0,0,0,0],[1,0,0,1],[3,3,2,2]], [[0,0,0,0],[1,0,0,1],[2,2,1,1]], [[0,0,0,0],[1,0,0,1],[1,1,0,0]], [[0,0,0,0],[2,1,1,2],[1,1,0,0]], [[0,0,0,0],[3,2,2,3],[1,1,0,0]], [[0,0,0,0],[3,2,2,3],[2,2,1,1]]; % green
    [[0,1,1,0], [0,0,1,1], [0,0,0,0]],  [[1,2,2,1], [0,0,1,1], [0,0,0,0]], [[2,3,3,2],[0,0,1,1],[0,0,0,0]], [[2,3,3,2],[1,1,2,2],[0,0,0,0]], [[2,3,3,2],[2,2,3,3],[0,0,0,0]], [[1,2,2,1],[2,2,3,3],[0,0,0,0]], [[0,1,1,0],[2,2,3,3],[0,0,0,0]], [[1,0,0,1],[1,1,2,2],[0,0,0,0]]];% yellow

arrow_positions = [2.5,  2.1,  2.9,   1.9,  1.1,  1.1,   3.1, 3.1, 3.1,   2.5,  2.1,  2.9,  -0.1, -0.1, -0.1,   1.9, 1.1, 1.1; % R
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
rotation_button_labels = {'R', 'R''', 'U', 'U''', 'L', 'L''', 'D', 'D''', 'F', 'F''', 'B', 'B'''};

face_color_rgb=[];
for i = 1:6
    for j = 1:8
        face_color_rgb(i,j,:) = possible_colors(i,:);
    end
end

    function main()
        fig = figure('Name','Rubiks Cube','NumberTitle','off','MenuBar','none','resize','off');
        elon = get_elon_ui();
        azim = get_azim_ui();

        ui_setup();
        generate_and_patch_ui_menu();
    end

    function ui_setup()
        uicontrol('Style', 'text', 'Position', [130 20 60 20], 'String', 'elongation');
        uicontrol('Style', 'text', 'Position', [130 40 50 20], 'String', 'azimuth');
		text_error = uicontrol('Style', 'text', 'Position', [495 220 50 85], 'String', 'there have to be 9 faces of each color', 'ForegroundColor', 'r', 'Visible', 'Off');
        text_not_solvable = uicontrol('Style', 'text', 'Position', [495 220 50 85], 'String', 'currently not solvable', 'ForegroundColor', 'r', 'Visible', 'Off');
		text_solved = uicontrol('Style', 'text', 'Position', [435 350 110 20], 'String', 'Solved!', 'ForegroundColor', 'g', 'Visible', 'Off');
		button_solve = uicontrol('Style', 'pushbutton', 'Position', [495 310 50 30], 'String', 'solve', 'Callback', @solve_cube);
        button_next = uicontrol('Style', 'pushbutton', 'Position', [495 380 50 30], 'String', 'next', 'Callback', @next_step, 'Enable', 'off');
        button_prev = uicontrol('Style', 'pushbutton', 'Position', [435 380 50 30], 'String', 'prev', 'Callback', @prev_step, 'Enable', 'off');
        checkbox_arrows = uicontrol('Style', 'checkbox', 'Value', 1, 'Position', [215 390 150 20], 'String', 'show arrows on rotation');
        button_group = uibuttongroup('Visible', 'off', 'SelectionChangedFcn', @change_input_method, 'UserData', 0, 'Position', [0.03 0.875 0.25 0.098], 'BorderType', 'none');
        uicontrol(button_group, 'Style', 'radiobutton', 'String', 'solve automatically', 'Position', [5 20 120 20]);
        uicontrol(button_group, 'Style', 'radiobutton', 'String', 'play around', 'Position', [5 0 100 20]);
        button_group.Visible = 'on';
        for i = 1:12
            rotation_buttons(i) = uicontrol('Style', 'pushbutton', 'UserData', i, 'Position', [10 350-20*i 40 20], 'String', rotation_button_labels{i}, 'Callback', @manual_turn, 'Enable', 'off');
        end
        rotate_view();
        axis off
        axis equal

        generate_centerpieces();
    end

    function change_input_method(source,~)
        switch source.UserData
            case 0
                for i = 1:12
                    set(rotation_buttons(i), 'Enable', 'on');
                end
                button_solve.Enable = 'off';
                button_next.Enable = 'off';
                button_prev.Enable = 'off';
                text_solved.Visible = 'off';
                text_error.Visible = 'off';
                text_not_solvable.Visible = 'off';
                source.UserData = 1;
            case 1
                for i = 1:12
                    set(rotation_buttons(i), 'Enable', 'off');
                end
                source.UserData = 0;
                button_solve.Enable = 'on';
        end
    end

    function manual_turn(source,~)
        turn(source.UserData);
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

    function generate_and_patch_ui_menu()
        for i = 1:6
            for j = 1:8
                cmenu(i, j) = generate_single_ui_menu(i, j);
            end
        end
        update_patches(cmenu);
    end

    function one_cmenu = generate_single_ui_menu(i, j)
        one_cmenu = uicontextmenu();
        uimenu(one_cmenu, 'Label', 'white', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'red', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'blue', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'orange', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'green', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'yellow', 'Callback', @change_color, 'UserData', [i j]);
    end

    function change_color(source, ~)
        i = source.UserData(1);
        j = source.UserData(2);
        switch source.Label
            case 'white'
                face_color_rgb(i,j,:) = possible_colors(1,:);
            case 'red'
                face_color_rgb(i,j,:) = possible_colors(2,:);
            case 'blue'
                face_color_rgb(i,j,:) = possible_colors(3,:);
            case 'orange'
                face_color_rgb(i,j,:) = possible_colors(4,:);
            case 'green'
                face_color_rgb(i,j,:) = possible_colors(5,:);
            case 'yellow'
                face_color_rgb(i,j,:) = possible_colors(6,:);
        end
        update_single_patch(cmenu, i, j);
        refresh;
    end






    function turn(dir)
        % R, R', U, U', L, L', D, D', F, F', B, B'
        for i = 1:12
            set(rotation_buttons(i), 'Enable', 'off');
        end
        for i = 0:1
            turn_arrows(i+1) = patch(arrow_positions(dir, (1+9*i):(3+9*i)), arrow_positions(dir, (4+9*i):(6+9*i)), arrow_positions(dir, (7+9*i):(9+9*i)), [0.5 0.1 0.5]);
        end
        if (checkbox_arrows.Value)
            pause(1);
        end
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
        hide_arrows(turn_arrows);
        if (button_group.UserData == 1)
            for i = 1:12
                set(rotation_buttons(i), 'Enable', 'on');
            end
        end
        refresh;
    end

    function turn_r()
        buf1 = face_color_rgb(1, 3, :);
        buf2 = face_color_rgb(1, 4, :);
        buf3 = face_color_rgb(1, 5, :);
        face_color_rgb(1, 3:5, :) = face_color_rgb(2, 3:5, :);
        face_color_rgb(2, 3:5, :) = face_color_rgb(6, 3:5, :);
        face_color_rgb(6, 3:4, :) = face_color_rgb(4, 7:8, :);
        face_color_rgb(6, 5, :) = face_color_rgb(4, 1, :);
        face_color_rgb(4, 7, :) = buf1;
        face_color_rgb(4, 8, :) = buf2;
        face_color_rgb(4, 1, :) = buf3;
        for j = 1:2
            buf = face_color_rgb(3,8,:);
            for i = 8:-1:2
                face_color_rgb(3,i,:) = face_color_rgb(3,i-1,:);
            end
            face_color_rgb(3,1,:) = buf;
        end
    end

    function reverse_turn_r()
        buf = face_color_rgb(1, 3:5, :);
        face_color_rgb(1, 3:4, :) = face_color_rgb(4, 7:8, :);
        face_color_rgb(1, 5, :) = face_color_rgb(4, 1, :);
        face_color_rgb(4, 7:8, :) = face_color_rgb(6, 3:4, :);
        face_color_rgb(4, 1, :) = face_color_rgb(6, 5, :);
        face_color_rgb(6, 3:5, :) = face_color_rgb(2, 3:5, :);
        face_color_rgb(2, 3:5, :) = buf;
        for j = 1:2
            buf = face_color_rgb(3,1,:);
            for i = 1:7
                face_color_rgb(3,i,:) = face_color_rgb(3,i+1,:);
            end
            face_color_rgb(3,8,:) = buf;
        end
    end

    function turn_u()
        buf = face_color_rgb(2, 1:3, :);
        for i = 2:4
            face_color_rgb(i, 1:3, :) = face_color_rgb(i+1, 1:3, :);
        end
        face_color_rgb(5, 1:3, :) = buf;
        for i = 1:2
            buf = face_color_rgb(1,8,:);
            for i = 8:-1:2
                face_color_rgb(1,i,:) = face_color_rgb(1,i-1,:);
            end
            face_color_rgb(1,1,:) = buf;
        end
    end

    function reverse_turn_u()
        buf = face_color_rgb(5, 1:3, :);
        for i = 5:-1:3
            face_color_rgb(i, 1:3, :) = face_color_rgb(i-1, 1:3, :);
        end
        face_color_rgb(2, 1:3, :) = buf;
        for j = 1:2
            buf = face_color_rgb(1,1,:);
            for i = 1:7
                face_color_rgb(1,i,:) = face_color_rgb(1,i+1,:);
            end
            face_color_rgb(1,8,:) = buf;
        end
    end

    function turn_l()
        buf1 = face_color_rgb(1, 1, :);
        buf2 = face_color_rgb(1, 7:8, :);
        face_color_rgb(1, 1, :) = face_color_rgb(4, 5, :);
        face_color_rgb(1, 7:8, :) = face_color_rgb(4, 3:4, :);
        face_color_rgb(4, 5, :) = face_color_rgb(6, 1, :);
        face_color_rgb(4, 3:4, :) = face_color_rgb(6, 7:8, :);
        face_color_rgb(6, 1, :) = face_color_rgb(2, 1, :);
        face_color_rgb(6, 7:8, :) = face_color_rgb(2, 7:8, :);
        face_color_rgb(2, 1, :) = buf1;
        face_color_rgb(2, 7:8, :) = buf2;
        for i = 1:2
            buf = face_color_rgb(5,8,:);
            for i = 8:-1:2
                face_color_rgb(5,i,:) = face_color_rgb(5,i-1,:);
            end
            face_color_rgb(5,1,:) = buf;
        end
    end

    function reverse_turn_l()
        buf1 = face_color_rgb(1, 1, :);
        buf2 = face_color_rgb(1, 7:8, :);
        face_color_rgb(1, 1, :) = face_color_rgb(2, 1, :);
        face_color_rgb(1, 7:8, :) = face_color_rgb(2, 7:8, :);
        face_color_rgb(2, 1, :) = face_color_rgb(6, 1, :);
        face_color_rgb(2, 7:8, :) = face_color_rgb(6, 7:8, :);
        face_color_rgb(6, 1, :) = face_color_rgb(4, 5, :);
        face_color_rgb(6, 7:8, :) = face_color_rgb(4, 3:4, :);
        face_color_rgb(4, 5, :) = buf1;
        face_color_rgb(4, 3:4, :) = buf2;
        for j = 1:2
            buf = face_color_rgb(5,1,:);
            for i = 1:7
                face_color_rgb(5,i,:) = face_color_rgb(5,i+1,:);
            end
            face_color_rgb(5,8,:) = buf;
        end
    end

    function turn_d()
        buf = face_color_rgb(2, 5:7, :);
        face_color_rgb(2, 5:7, :) = face_color_rgb(5, 5:7, :);
        face_color_rgb(5, 5:7, :) = face_color_rgb(4, 5:7, :);
        face_color_rgb(4, 5:7, :) = face_color_rgb(3, 5:7, :);
        face_color_rgb(3, 5:7, :) = buf;
        for i = 1:2
            buf = face_color_rgb(6,8,:);
            for i = 8:-1:2
                face_color_rgb(6,i,:) = face_color_rgb(6,i-1,:);
            end
            face_color_rgb(6,1,:) = buf;
        end
    end

    function reverse_turn_d()
        buf = face_color_rgb(2, 5:7, :);
        face_color_rgb(2, 5:7, :) = face_color_rgb(3, 5:7, :);
        face_color_rgb(3, 5:7, :) = face_color_rgb(4, 5:7, :);
        face_color_rgb(4, 5:7, :) = face_color_rgb(5, 5:7, :);
        face_color_rgb(5, 5:7, :) = buf;
        for j = 1:2
            buf = face_color_rgb(6,1,:);
            for i = 1:7
                face_color_rgb(6,i,:) = face_color_rgb(6,i+1,:);
            end
            face_color_rgb(6,8,:) = buf;
        end
    end

    function turn_f()
        buf1 = face_color_rgb(1, 7, :);
        buf2 = face_color_rgb(1, 5:6, :);
        face_color_rgb(1, 5:7, :) = face_color_rgb(5, 3:5, :);
        face_color_rgb(5, 3:5, :) = face_color_rgb(6, 1:3, :);
        face_color_rgb(6, 1:2, :) = face_color_rgb(3, 7:8, :);
        face_color_rgb(6, 3, :) = face_color_rgb(3, 1, :);
        face_color_rgb(3, 1, :) = buf1;
        face_color_rgb(3, 7:8, :) = buf2;
        for i = 1:2
            buf = face_color_rgb(2,8,:);
            for i = 8:-1:2
                face_color_rgb(2,i,:) = face_color_rgb(2,i-1,:);
            end
            face_color_rgb(2,1,:) = buf;
        end
    end

    function reverse_turn_f()
        buf = face_color_rgb(1, 5:7, :);
        face_color_rgb(1, 7, :) = face_color_rgb(3, 1, :);
        face_color_rgb(1, 5:6, :) = face_color_rgb(3, 7:8, :);
        face_color_rgb(3, 1, :) = face_color_rgb(6,3,:);
        face_color_rgb(3,7:8,:) = face_color_rgb(6,1:2,:);
        face_color_rgb(6,1:3,:) = face_color_rgb(5,3:5,:);
        face_color_rgb(5,3:5,:) = buf;
        for j = 1:2
            buf = face_color_rgb(2,1,:);
            for i = 1:7
                face_color_rgb(2,i,:) = face_color_rgb(2,i+1,:);
            end
            face_color_rgb(2,8,:) = buf;
        end
    end

	function turn_b()
        buf1 = face_color_rgb(1,1:2,:);
        buf2 = face_color_rgb(1,3,:);
        face_color_rgb(1,1:3,:) = face_color_rgb(3,3:5,:);
        face_color_rgb(3,3:5,:) = face_color_rgb(6,5:7,:);
        face_color_rgb(6,5:6,:) = face_color_rgb(5,7:8,:);
        face_color_rgb(6,7,:) = face_color_rgb(5,1,:);
        face_color_rgb(5,7:8,:) = buf1;
        face_color_rgb(5,1,:) = buf2;
        for i = 1:2
            buf = face_color_rgb(4,8,:);
            for i = 8:-1:2
                face_color_rgb(4,i,:) = face_color_rgb(4,i-1,:);
            end
            face_color_rgb(4,1,:) = buf;
        end
    end

    function reverse_turn_b()
        buf = face_color_rgb(1,1:3,:);
        face_color_rgb(1,3,:) = face_color_rgb(5,1,:);
        face_color_rgb(1,1:2,:) = face_color_rgb(5,7:8,:);
        face_color_rgb(5,1,:) = face_color_rgb(6,7,:);
        face_color_rgb(5,7:8,:) = face_color_rgb(6,5:6,:);
        face_color_rgb(6,5:7,:) = face_color_rgb(3,3:5,:);
        face_color_rgb(3,3:5,:) = buf;
        for j = 1:2
            buf = face_color_rgb(4,1,:);
            for i = 1:7
                face_color_rgb(4,i,:) = face_color_rgb(4,i+1,:);
            end
            face_color_rgb(4,8,:) = buf;
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
        patch(face_positions(i,(12*j-11):(12*j-8)), face_positions(i,(12*j-7):(12*j-4)), face_positions(i,(12*j-3):(12*j)), face_color_rgb(i,j,:), 'UIContextMenu', cmenu(i,j), 'UserData', [i j]);
    end

    function hide_arrows(arrows)
        for i = 0:1
            arrows(i+1).Visible = 'Off';
        end
    end

	function solve_cube(~, ~)
		face_color_code = zeros(6,8);
		elon.Value = 0.9;
		azim.Value = 0.625;
		rotate_view();
        button_solve.Enable = 'off';
		for i = 1:6
			for j = 1:8
				cc(1:3) = face_color_rgb(i, j, :);
				if isequal(cc, [1 1 1])
					face_color_code(i, j) = 1;
				elseif isequal(cc, [1 0 0])
					face_color_code(i, j) = 2;
				elseif isequal(cc, [0 0 1])
					face_color_code(i, j) = 3;
				elseif isequal(cc, [1 0.6 0])
					face_color_code(i, j) = 4;
				elseif isequal(cc, [0 1 0])
					face_color_code(i, j) = 5;
				else
					face_color_code(i, j) = 6;
				end
			end
		end
		vals = tabulate(face_color_code(:));
		vals2(1:6) = vals(:, 2);
        if ~isequal(vals2, [8 8 8 8 8 8])
			text_error.Visible = 'On';
        else
            text_error.Visible = 'Off';
            text_not_solvable.Visible = 'off';
            turn_list = [];
            turn_list = generate_solution(face_color_code);
			if (~isempty(turn_list))
                button_prev.Enable = 'off';
                if (turn_list == -1)
                    text_not_solvable.Visible = 'on';
                else
                    button_next.Enable = 'on';
                    text_solved.Visible = 'on';
                    text_solved.String = strcat('Solved in', {' '}, int2str(length(turn_list)), ' steps!');
                    solve_step = 1;
                end
			else
				disp('Already solved');
            end
        end
        button_solve.Enable = 'on';
    end

    function next_step(~, ~)
        button_next.Enable = 'off';
        button_prev.Enable = 'off';
        turn(turn_list(solve_step));
        button_next.Enable = 'on';
        button_prev.Enable = 'on';
        solve_step = solve_step + 1;
        if (solve_step > length(turn_list))
            button_next.Enable = 'off';
		end
    end

    function prev_step(~, ~)
        button_next.Enable = 'off';
        button_prev.Enable = 'off';
        turn(get_reverse_turn(turn_list(solve_step - 1)));
        button_next.Enable = 'on';
        button_prev.Enable = 'on';
        solve_step = solve_step - 1;
        if (solve_step == 1)
            button_prev.Enable = 'off';
        end
    end

    function reverse_turn = get_reverse_turn(current_turn)
        if mod(current_turn, 2) == 0
            reverse_turn = current_turn - 1;
        else
            reverse_turn = current_turn + 1;
        end
    end


main();

end
