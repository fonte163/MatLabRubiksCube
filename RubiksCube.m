function RubiksCube()

global face_color;
global possible_colors;
global face_positions;
global arrow_positions;
global rotation_button_labels;
global cmenu;
global text_help;
global text_error;
global text_solved;
global text_not_solvable;
global button_solve;
global button_next;
global button_prev;
global button_group;
global rotation_buttons;
global turn_list;
global solve_step;
global checkbox_arrows;
global menubar_color;
global menubar_color_def;
global menubar_color_alt;
global menubar_color_cus;
global menubar_cube_presets;
global color_dialog;
global color_dialog_colors;
global cube_presets;



setup();
main();



    function setup()
        possible_colors = [[1,1,1]; [1,0,0]; [0,0,1]; [1,0.6,0]; [0,1,0]; [1,1,0]];

        face_positions = [[[0,1,1,0], [3,3,2,2], [3,3,3,3]],  [[1,2,2,1], [3,3,2,2], [3,3,3,3]], [[2,3,3,2],[3,3,2,2],[3,3,3,3]], [[2,3,3,2],[2,2,1,1],[3,3,3,3]], [[2,3,3,2],[1,1,0,0],[3,3,3,3]], [[1,2,2,1],[1,1,0,0],[3,3,3,3]], [[0,1,1,0],[1,1,0,0],[3,3,3,3]], [[0,1,1,0],[2,2,1,1],[3,3,3,3]]; % white
            [[0,1,1,0], [0,0,0,0], [3,3,2,2]],  [[1,2,2,1], [0,0,0,0], [3,3,2,2]], [[2,3,3,2],[0,0,0,0],[3,3,2,2]], [[2,3,3,2],[0,0,0,0],[2,2,1,1]], [[2,3,3,2],[0,0,0,0],[1,1,0,0]], [[1,2,2,1],[0,0,0,0],[1,1,0,0]], [[0,1,1,0],[0,0,0,0],[1,1,0,0]], [[0,1,1,0],[0,0,0,0],[2,2,1,1]]; % red
            [[3,3,3,3], [0,1,1,0], [3,3,2,2]],  [[3,3,3,3], [1,2,2,1], [3,3,2,2]], [[3,3,3,3],[2,3,3,2],[3,3,2,2]], [[3,3,3,3],[2,3,3,2],[2,2,1,1]], [[3,3,3,3],[2,3,3,2],[1,1,0,0]], [[3,3,3,3],[1,2,2,1],[1,1,0,0]], [[3,3,3,3],[0,1,1,0],[1,1,0,0]], [[3,3,3,3],[0,1,1,0],[2,2,1,1]]; % blue
            [[3,2,2,3], [3,3,3,3], [3,3,2,2]],  [[2,1,1,2], [3,3,3,3], [3,3,2,2]], [[1,0,0,1],[3,3,3,3],[3,3,2,2]], [[1,0,0,1],[3,3,3,3],[2,2,1,1]], [[1,0,0,1],[3,3,3,3],[1,1,0,0]], [[2,1,1,2],[3,3,3,3],[1,1,0,0]], [[3,2,2,3],[3,3,3,3],[1,1,0,0]], [[3,2,2,3],[3,3,3,3],[2,2,1,1]]; % orange
            [[0,0,0,0], [3,2,2,3], [3,3,2,2]],  [[0,0,0,0], [2,1,1,2], [3,3,2,2]], [[0,0,0,0],[1,0,0,1],[3,3,2,2]], [[0,0,0,0],[1,0,0,1],[2,2,1,1]], [[0,0,0,0],[1,0,0,1],[1,1,0,0]], [[0,0,0,0],[2,1,1,2],[1,1,0,0]], [[0,0,0,0],[3,2,2,3],[1,1,0,0]], [[0,0,0,0],[3,2,2,3],[2,2,1,1]]; % green
            [[0,1,1,0], [0,0,1,1], [0,0,0,0]],  [[1,2,2,1], [0,0,1,1], [0,0,0,0]], [[2,3,3,2],[0,0,1,1],[0,0,0,0]], [[2,3,3,2],[1,1,2,2],[0,0,0,0]], [[2,3,3,2],[2,2,3,3],[0,0,0,0]], [[1,2,2,1],[2,2,3,3],[0,0,0,0]], [[0,1,1,0],[2,2,3,3],[0,0,0,0]], [[1,0,0,1],[1,1,2,2],[0,0,0,0]]];% yellow

        arrow_positions = [2.5,  2.1,  2.9,   1.9,  1.1,  1.1,   3.1, 3.1, 3.1,   2.5,  2.1,  2.9,  -0.1, -0.1, -0.1,   1.9, 1.1, 1.1,  2.5, 2.1, 2.9,  1.1, 1.9, 1.9,  -0.1, -0.1, -0.1,  2.5, 2.1, 2.9,  3.1, 3.1, 3.1,  1.1, 1.9, 1.9; % R
            2.5,  2.9,  2.1,  -0.1, -0.1, -0.1,   1.1, 1.9, 1.9,   2.5,  2.9,  2.1,   1.1,  1.9,  1.9,   3.1, 3.1, 3.1,  2.5, 2.9, 2.1,  3.1, 3.1, 3.1,  1.9, 1.1, 1.1,  2.5, 2.1, 2.9,  1.9, 1.1, 1.1,  -0.1, -0.1, -0.1; % R'
            1.1,  1.9,  1.9,  -0.1, -0.1, -0.1,   2.5, 2.1, 2.9,  -0.1, -0.1, -0.1,   1.9,  1.1,  1.1,   2.5, 2.1, 2.9,  3.1, 3.1, 3.1,  1.1, 1.9, 1.9,  2.5, 2.1, 2.9,  1.9, 1.1, 1.1,  3.1, 3.1, 3.1,  2.5, 2.1, 2.9; % U
            -0.1, -0.1, -0.1,   1.1,  1.9,  1.9,   2.5, 2.9, 2.1,   1.9,  1.1,  1.1,  -0.1, -0.1, -0.1,   2.5, 2.9, 2.1,  1.1, 1.9, 1.9,  3.1, 3.1, 3.1,  2.5, 2.9, 2.1,  3.1, 3.1, 3.1,  1.9, 1.1, 1.1,  2.5, 2.9, 2.1; % U'
            0.5,  0.9,  0.1,   1.1,  1.9,  1.9,   3.1, 3.1, 3.1,   0.5,  0.9,  0.1,  -0.1, -0.1, -0.1,   1.1, 1.9, 1.9,  0.5, 0.9, 0.1,  3.1, 3.1, 3.1,  1.9, 1.1, 1.1,  0.5, 0.9, 0.1,  1.9, 1.1, 1.1,  -0.1, -0.1, -0.1; % L
            0.5,  0.1,  0.9,  -0.1, -0.1, -0.1,   1.9, 1.1, 1.1,   0.5,  0.1,  0.9,   1.9,  1.1,  1.1,   3.1, 3.1, 3.1,  0.5, 0.1, 0.9,  1.1, 1.9, 1.9,  -0.1, -0.1, -0.1,  0.5, 0.1, 0.9,  3.1, 3.1, 3.1,  1.1, 1.9, 1.9; % L'
            -0.1, -0.1, -0.1,   1.1,  1.9,  1.9,   0.5, 0.9, 0.1,   1.9,  1.1,  1.1,  -0.1, -0.1, -0.1,   0.5, 0.9, 0.1,  1.1, 1.9, 1.9,  3.1, 3.1, 3.1,  0.5, 0.9, 0.1,  3.1, 3.1, 3.1,  1.9, 1.1, 1.1,  0.5, 0.9, 0.1; % D
            1.1,  1.9,  1.9,  -0.1, -0.1, -0.1,   0.5, 0.1, 0.9,  -0.1, -0.1, -0.1,   1.9,  1.1,  1.1,   0.5, 0.1, 0.9,  3.1, 3.1, 3.1,  1.1, 1.9, 1.9,  0.5, 0.1, 0.9,  1.9, 1.1, 1.1,  3.1, 3.1, 3.1,  0.5, 0.1, 0.9; % D'
            -0.1, -0.1, -0.1,   0.5,  0.9,  0.1,   1.9, 1.1, 1.1,   1.9,  1.1,  1.1,   0.5,  0.9,  0.1,   3.1, 3.1, 3.1,  1.1, 1.9, 1.9,  0.5, 0.9, 0.1,  -0.1, -0.1, -0.1,  3.1, 3.1, 3.1,  0.5, 0.9, 0.1,  1.1, 1.9, 1.9; % F
            1.1,  1.9,  1.9,   0.5,  0.1,  0.9,   3.1, 3.1, 3.1,  -0.1, -0.1, -0.1,   0.5,  0.1,  0.9,   1.1, 1.9, 1.9,  3.1, 3.1, 3.1,  0.5, 0.1, 0.9,  1.9, 1.1, 1.1,  1.9, 1.1, 1.1,  0.5, 0.9, 0.1,  -0.1, -0.1, -0.1; % F'
            1.1,  1.9,  1.9,   2.5,  2.1,  2.9,   3.1, 3.1, 3.1,  -0.1, -0.1, -0.1,   2.5,  2.1,  2.9,   1.1, 1.9, 1.9,  3.1, 3.1, 3.1,  2.5, 2.1, 2.9,  1.9, 1.1, 1.1,  1.9, 1.1, 1.1,  2.5, 2.1, 2.9,  -0.1, -0.1, -0.1; % B
            -0.1, -0.1, -0.1,   2.5,  2.9,  2.1,   1.9, 1.1, 1.1,   1.9,  1.1,  1.1,   2.5,  2.9,  2.1,   3.1, 3.1, 3.1,  1.1, 1.9, 1.9,  2.5, 2.9, 2.1,  -0.1, -0.1, -0.1,  3.1, 3.1, 3.1,  2.5, 2.9, 2.1,  1.1, 1.9, 1.9; % B'
            ];
        rotation_button_labels = {'R', 'R''', 'U', 'U''', 'L', 'L''', 'D', 'D''', 'F', 'F''', 'B', 'B'''};

        face_color = zeros(6,8);
        for i = 1:6
            for j = 1:8
                face_color(i,j) = i;
            end
        end
    end

    function main()
        figure('Name','Rubiks Cube','NumberTitle','off','MenuBar','none','resize','off', 'DockControls', 'off');

        ui_setup();
        generate_patch_and_ui_menu();
    end

    function ui_setup()
        menubar_color = uimenu('Text', 'Color scheme');
        menubar_color_def = uimenu(menubar_color, 'Text', 'Default', 'Callback', @update_cube_color_def, 'Checked', 'on');
        menubar_color_alt = uimenu(menubar_color, 'Text', 'Alternative', 'Callback', @update_cube_color_alt);
        menubar_color_cus = uimenu(menubar_color, 'Text', 'Custom...', 'Callback', @update_cube_color_cus);

        menubar_cube_presets = uimenu('Text', 'Cube presets');


        load_presets();
        uimenu(menubar_cube_presets, 'Text', '+ save new Preset', 'Callback', @add_preset);

        text_help = uicontrol('Style', 'text', 'Position', [230 0 120 30], 'String', 'right-click to modify');
        uicontrol('Style', 'togglebutton', 'Position', [20 20 50 30], 'Callback', @rotate_button_callback, 'String', 'rotate');
        text_error = uicontrol('Style', 'text', 'Position', [495 220 50 85], 'String', 'there have to be 9 faces of each color', 'ForegroundColor', 'r', 'Visible', 'Off');
        text_not_solvable = uicontrol('Style', 'text', 'Position', [495 220 50 85], 'String', 'currently not solvable', 'ForegroundColor', 'r', 'Visible', 'Off');
        text_solved = uicontrol('Style', 'text', 'Position', [435 350 110 20], 'String', 'Solved!', 'ForegroundColor', 'g', 'Visible', 'Off');
        button_solve = uicontrol('Style', 'pushbutton', 'Position', [495 310 50 30], 'String', 'solve', 'Callback', @solve_cube);
        button_next = uicontrol('Style', 'pushbutton', 'Position', [495 380 50 30], 'String', 'next', 'Callback', @next_step, 'Enable', 'off');
        button_prev = uicontrol('Style', 'pushbutton', 'Position', [435 380 50 30], 'String', 'prev', 'Callback', @prev_step, 'Enable', 'off');
        checkbox_arrows = uicontrol('Style', 'checkbox', 'Value', 1, 'Position', [215 400 150 20], 'String', 'show arrows on rotation');
        button_group = uibuttongroup('Visible', 'off', 'SelectionChangedFcn', @change_input_method, 'UserData', 0, 'Position', [0.03 0.875 0.25 0.098], 'BorderType', 'none');
        uicontrol(button_group, 'Style', 'radiobutton', 'String', 'solve automatically', 'Position', [5 20 120 20]);
        uicontrol(button_group, 'Style', 'radiobutton', 'String', 'play around', 'Position', [5 0 100 20]);
        uicontrol('Style', 'pushbutton', 'String', 'reset', 'Position', [495 20 50 30], 'Callback', @reset_cube);
        button_group.Visible = 'on';
        for i = 1:12
            rotation_buttons(i) = uicontrol('Style', 'pushbutton', 'UserData', i, 'Position', [20 330-20*i 40 20], 'String', rotation_button_labels(i), 'Callback', @manual_turn, 'Enable', 'off');
        end
        axis off
        axis equal


        rotate_view();
        generate_centerpieces();
    end

    function rgb = hex2rgb(hexcell)
        if (isempty(hexcell))
            rgb = 0;
            return;
        end
        k = 1;
        for hex = hexcell
            hex = double(upper(hex));
            letters = hex > 64;
            hex(letters) = hex(letters) - 'A' + 10;

            rgb(k, :) = zeros(3);
            for i = 1:3
                rgb(k, i) = hex(i*2-1) * 16 + hex(i*2);
            end
            k = k + 1;
        end
    end

    function load_presets()
        fid = fopen('resources.txt');
        if (fid ~= -1)
            color_dialog_colors = hex2rgb(regexp(fgetl(fid), '[0-9a-fA-F]{6}', 'match'))./255;
            if (length(color_dialog_colors) ~= 6)
                color_dialog_colors = possible_colors;
                msgbox('Couldn''t load color definitions from resource.txt');
            end

            error_list = [];
            i = 1;
            j = 2;
            while (~feof(fid))
                current_line = fgetl(fid);
                color_codes = regexp(current_line, '[1-6]+(?=\s)', 'match');
                if (isempty(color_codes))
                    error_list(end+1) = j;
                else
                    color_codes = color_codes{1};
                    if (length(color_codes) ~= 48)
                        error_list(end+1) = j;
                    else
                        for k = 1:6
                            for l = 1:8
                                cube_presets(i, k, l) = str2double(color_codes((k-1)*8+l));
                            end
                        end
                        title = cell2mat(regexp(current_line, '(?<=\s).*', 'match'));
                        if (isempty(title))
                            title = '(empty)';
                        end
                        uimenu(menubar_cube_presets, 'Text', title, 'UserData', i, 'Callback', @open_preset);
                        i = i + 1;
                    end
                end
                j = j + 1;
            end
            fclose(fid);
            if (~isempty(error_list))
                error_string = 'Couldn''t load preset[s] in line[s] ';
                for a = 1:length(error_list)
                    if a == 1
                        error_string = [error_string num2str(error_list(a))];
                    else
                        error_string = [error_string ', ' num2str(error_list(a))];
                    end
                end
                error_string = [error_string ' from resource.txt'];
                msgbox(error_string);
            end
        else
            color_dialog_colors = possible_colors;
        end
    end

    function add_preset(source, ~)
        delete(source);
        if (isfile('resources.txt'))
            content = '\r\n';
        else
            content = '                                          \r\n';
        end
        for i = 1:6
            for j = 1:8
                content = [content num2str(face_color(i,j))];
            end
        end
        input = cell2mat(inputdlg('Name:'));
        if (~isempty(input))
            input = cell2mat(regexp(input, '[\w\s\(\)_\-]', 'match'));
            content = [content ' ' input];
            fid = fopen('resources.txt', 'a');
            fprintf(fid, content);
            fclose(fid);
            data = size(cube_presets);
            data = data(1) + 1;
            cube_presets(data, :, :) = face_color(:, :);
            uimenu(menubar_cube_presets, 'Text', input, 'Callback', @open_preset, 'UserData', data);
        else
            msgbox('Name can''t be empty.');
        end
        uimenu(menubar_cube_presets, 'Text', '+ save new preset', 'Callback', @add_preset);
    end

    function open_preset(source, ~)
        face_color(:, :) = cube_presets(source.UserData, :, :);
        refresh_cube();
        button_next.Enable = 'off';
        button_prev.Enable = 'off';
        text_solved.Visible = 'off';
        text_error.Visible = 'off';
        text_not_solvable.Visible = 'off';
    end


    function refresh_cube()
        generate_centerpieces();
        update_patches();
        refresh;
    end


    function update_cube_color_def(~, ~)
        possible_colors = [[1,1,1]; [1,0,0]; [0,0,1]; [1,0.6,0]; [0,1,0]; [1,1,0]];
        menubar_color_def.Checked = 'on';
        menubar_color_alt.Checked = 'off';
        menubar_color_cus.Checked = 'off';
        refresh_cube();
    end

    function update_cube_color_alt(~, ~)
        possible_colors = [[1,1,1]; [1,0,0]; [1,1,0]; [1,0.6,0]; [0,1,0]; [0,0,1]];
        menubar_color_def.Checked = 'off';
        menubar_color_alt.Checked = 'on';
        menubar_color_cus.Checked = 'off';
        refresh_cube();
    end

    function update_cube_color_cus(~, ~)
        width = 130;
        height = 240;

        fig = gcf;
        pos = fig.Position;
        pos(1) = pos(1) + (pos(3) - width) / 2;
        pos(2) = pos(2) + (pos(4) - height) / 2;
        pos(3:4) = [width height];
        color_dialog = dialog('Position', pos, 'Name', 'CubeColorPicker');
        color_custom_generate_ui();

        uiwait(color_dialog);
        refresh_cube();
    end

    function color_custom_generate_ui()
        for i = 1:6
            uicontrol('Parent', color_dialog, 'Style', 'pushbutton', 'Position', [80 200-30*(i-1) 25 25], 'Callback', @color_custom_button_callback, 'BackgroundColor', color_dialog_colors(i,:), 'String', '', 'UserData', i);
        end
        uicontrol('Parent', color_dialog, 'Style', 'text', 'String', 'Top', 'Position', [20 195 50 25], 'HorizontalAlignment', 'left');
        uicontrol('Parent', color_dialog, 'Style', 'text', 'String', 'Front', 'Position', [20 165 50 25], 'HorizontalAlignment', 'left');
        uicontrol('Parent', color_dialog, 'Style', 'text', 'String', 'Right', 'Position', [20 135 50 25], 'HorizontalAlignment', 'left');
        uicontrol('Parent', color_dialog, 'Style', 'text', 'String', 'Back', 'Position', [20 105 50 25], 'HorizontalAlignment', 'left');
        uicontrol('Parent', color_dialog, 'Style', 'text', 'String', 'Left', 'Position', [20 75 50 25], 'HorizontalAlignment', 'left');
        uicontrol('Parent', color_dialog, 'Style', 'text', 'String', 'Bottom', 'Position', [20 45 50 25], 'HorizontalAlignment', 'left');

        uicontrol('Parent', color_dialog, 'Style', 'pushbutton', 'Position', [10 10 50 25], 'Callback', 'delete(gcf);', 'String', 'Cancel');
        uicontrol('Parent', color_dialog, 'Style', 'pushbutton', 'Position', [70 10 50 25], 'String', 'OK', 'Callback', @color_custom_ok_button_callback);
    end

    function color_custom_button_callback(source, ~)
        new_color(:) = uisetcolor(color_dialog_colors(source.UserData, :));
        source.BackgroundColor = new_color;
        color_dialog_colors(source.UserData, :) = new_color;
    end

    function color_custom_ok_button_callback(~, ~)
        fid = fopen('resources.txt', 'r+');
        for i = 1:6
            rgb = color_dialog_colors(i,:).*255;
            fprintf(fid, strcat('#', reshape(sprintf('%02x',rgb.'),6,[]).'));
        end
        fprintf(fid, '\r\n');
        fclose(fid);
        possible_colors = color_dialog_colors;
        delete(gcf);
        menubar_color_def.Checked = 'off';
        menubar_color_alt.Checked = 'off';
        menubar_color_cus.Checked = 'on';
    end


    function rotate_button_callback(button, ~, ~)
        if get(button,'Value') == get(button,'Max')
            rotate3d on;
            button.String = 'modify';
            text_help.String = 'click and drag to rotate';
        else
            rotate3d off;
            button.String = 'rotate';
            text_help.String = 'right-click to modify';
        end
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

    function reset_cube(~,~)
        for i = 1:6
            for j = 1:8
                face_color(i,j) = i;
            end
        end
        update_patches();
        button_next.Enable = 'off';
        button_prev.Enable = 'off';
        text_solved.Visible = 'off';
        text_error.Visible = 'off';
        text_not_solvable.Visible = 'off';
        rotate_view();
        refresh;
    end

    function manual_turn(source,~)
        turn(source.UserData);
    end

    function rotate_view(~, ~)
        view([325 25]);
    end

    function generate_centerpieces()
        patch([1,2,2,1],[2,2,1,1],[3,3,3,3], possible_colors(1,:));
        patch([1,2,2,1],[0,0,0,0],[2,2,1,1], possible_colors(2,:));
        patch([3,3,3,3],[1,2,2,1],[2,2,1,1], possible_colors(3,:));
        patch([2,1,1,2],[3,3,3,3],[2,2,1,1], possible_colors(4,:));
        patch([0,0,0,0],[2,1,1,2],[2,2,1,1], possible_colors(5,:));
        patch([1,2,2,1],[1,1,2,2],[0,0,0,0], possible_colors(6,:));
    end

    function generate_patch_and_ui_menu()
        for i = 1:6
            for j = 1:8
                cmenu(i, j) = generate_single_ui_menu(i, j);
            end
        end
        update_patches();
    end

    function one_cmenu = generate_single_ui_menu(i, j)
        one_cmenu = uicontextmenu();
        uimenu(one_cmenu, 'Label', 'top color', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'front color', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'right color', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'back color', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'left color', 'Callback', @change_color, 'UserData', [i j]);
        uimenu(one_cmenu, 'Label', 'bottom color', 'Callback', @change_color, 'UserData', [i j]);
    end

    function change_color(source, ~)
        i = source.UserData(1);
        j = source.UserData(2);
        switch source.Label
            case 'top color'
                face_color(i,j) = 1;
            case 'front color'
                face_color(i,j) = 2;
            case 'right color'
                face_color(i,j) = 3;
            case 'back color'
                face_color(i,j) = 4;
            case 'left color'
                face_color(i,j) = 5;
            case 'bottom color'
                face_color(i,j) = 6;
        end
        update_single_patch(i, j);
        refresh;
    end






    function turn(dir)
        % R, R', U, U', L, L', D, D', F, F', B, B'
        for i = 1:12
            set(rotation_buttons(i), 'Enable', 'off');
        end
        if (checkbox_arrows.Value)
            for i = 0:3
                turn_arrows(i+1) = patch(arrow_positions(dir, (1+9*i):(3+9*i)), arrow_positions(dir, (4+9*i):(6+9*i)), arrow_positions(dir, (7+9*i):(9+9*i)), [0.5 0.1 0.5]);
            end
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
        update_patches();
        if (checkbox_arrows.Value)
            hide_arrows(turn_arrows);
        end
        if (button_group.UserData == 1)
            for i = 1:12
                set(rotation_buttons(i), 'Enable', 'on');
            end
        end
        refresh;
    end

    function turn_r()
        buf1 = face_color(1, 3);
        buf2 = face_color(1, 4);
        buf3 = face_color(1, 5);
        face_color(1, 3:5) = face_color(2, 3:5);
        face_color(2, 3:5) = face_color(6, 3:5);
        face_color(6, 3:4) = face_color(4, 7:8);
        face_color(6, 5) = face_color(4, 1);
        face_color(4, 7) = buf1;
        face_color(4, 8) = buf2;
        face_color(4, 1) = buf3;
        for j = 1:2
            buf = face_color(3,8);
            for i = 8:-1:2
                face_color(3,i) = face_color(3,i-1);
            end
            face_color(3,1) = buf;
        end
    end

    function reverse_turn_r()
        buf = face_color(1, 3:5);
        face_color(1, 3:4) = face_color(4, 7:8);
        face_color(1, 5) = face_color(4, 1);
        face_color(4, 7:8) = face_color(6, 3:4);
        face_color(4, 1) = face_color(6, 5);
        face_color(6, 3:5) = face_color(2, 3:5);
        face_color(2, 3:5) = buf;
        for j = 1:2
            buf = face_color(3,1);
            for i = 1:7
                face_color(3,i) = face_color(3,i+1);
            end
            face_color(3,8) = buf;
        end
    end

    function turn_u()
        buf = face_color(2, 1:3);
        for i = 2:4
            face_color(i, 1:3) = face_color(i+1, 1:3);
        end
        face_color(5, 1:3) = buf;
        for j = 1:2
            buf = face_color(1,8);
            for i = 8:-1:2
                face_color(1,i) = face_color(1,i-1);
            end
            face_color(1,1) = buf;
        end
    end

    function reverse_turn_u()
        buf = face_color(5, 1:3);
        for i = 5:-1:3
            face_color(i, 1:3) = face_color(i-1, 1:3);
        end
        face_color(2, 1:3) = buf;
        for j = 1:2
            buf = face_color(1,1);
            for i = 1:7
                face_color(1,i) = face_color(1,i+1);
            end
            face_color(1,8) = buf;
        end
    end

    function turn_l()
        buf1 = face_color(1, 1);
        buf2 = face_color(1, 7:8);
        face_color(1, 1) = face_color(4, 5);
        face_color(1, 7:8) = face_color(4, 3:4);
        face_color(4, 5) = face_color(6, 1);
        face_color(4, 3:4) = face_color(6, 7:8);
        face_color(6, 1) = face_color(2, 1);
        face_color(6, 7:8) = face_color(2, 7:8);
        face_color(2, 1) = buf1;
        face_color(2, 7:8) = buf2;
        for j = 1:2
            buf = face_color(5,8);
            for i = 8:-1:2
                face_color(5,i) = face_color(5,i-1);
            end
            face_color(5,1) = buf;
        end
    end

    function reverse_turn_l()
        buf1 = face_color(1, 1);
        buf2 = face_color(1, 7:8);
        face_color(1, 1) = face_color(2, 1);
        face_color(1, 7:8) = face_color(2, 7:8);
        face_color(2, 1) = face_color(6, 1);
        face_color(2, 7:8) = face_color(6, 7:8);
        face_color(6, 1) = face_color(4, 5);
        face_color(6, 7:8) = face_color(4, 3:4);
        face_color(4, 5) = buf1;
        face_color(4, 3:4) = buf2;
        for j = 1:2
            buf = face_color(5,1);
            for i = 1:7
                face_color(5,i) = face_color(5,i+1);
            end
            face_color(5,8) = buf;
        end
    end

    function turn_d()
        buf = face_color(2, 5:7);
        face_color(2, 5:7) = face_color(5, 5:7);
        face_color(5, 5:7) = face_color(4, 5:7);
        face_color(4, 5:7) = face_color(3, 5:7);
        face_color(3, 5:7) = buf;
        for j = 1:2
            buf = face_color(6,8);
            for i = 8:-1:2
                face_color(6,i) = face_color(6,i-1);
            end
            face_color(6,1) = buf;
        end
    end

    function reverse_turn_d()
        buf = face_color(2, 5:7);
        face_color(2, 5:7) = face_color(3, 5:7);
        face_color(3, 5:7) = face_color(4, 5:7);
        face_color(4, 5:7) = face_color(5, 5:7);
        face_color(5, 5:7) = buf;
        for j = 1:2
            buf = face_color(6,1);
            for i = 1:7
                face_color(6,i) = face_color(6,i+1);
            end
            face_color(6,8) = buf;
        end
    end

    function turn_f()
        buf1 = face_color(1, 7);
        buf2 = face_color(1, 5:6);
        face_color(1, 5:7) = face_color(5, 3:5);
        face_color(5, 3:5) = face_color(6, 1:3);
        face_color(6, 1:2) = face_color(3, 7:8);
        face_color(6, 3) = face_color(3, 1);
        face_color(3, 1) = buf1;
        face_color(3, 7:8) = buf2;
        for j = 1:2
            buf = face_color(2,8);
            for i = 8:-1:2
                face_color(2,i) = face_color(2,i-1);
            end
            face_color(2,1) = buf;
        end
    end

    function reverse_turn_f()
        buf = face_color(1, 5:7);
        face_color(1, 7) = face_color(3, 1);
        face_color(1, 5:6) = face_color(3, 7:8);
        face_color(3, 1) = face_color(6,3);
        face_color(3,7:8) = face_color(6,1:2);
        face_color(6,1:3) = face_color(5,3:5);
        face_color(5,3:5) = buf;
        for j = 1:2
            buf = face_color(2,1);
            for i = 1:7
                face_color(2,i) = face_color(2,i+1);
            end
            face_color(2,8) = buf;
        end
    end

	function turn_b()
        buf1 = face_color(1,1:2);
        buf2 = face_color(1,3);
        face_color(1,1:3) = face_color(3,3:5);
        face_color(3,3:5) = face_color(6,5:7);
        face_color(6,5:6) = face_color(5,7:8);
        face_color(6,7) = face_color(5,1);
        face_color(5,7:8) = buf1;
        face_color(5,1) = buf2;
        for j = 1:2
            buf = face_color(4,8);
            for i = 8:-1:2
                face_color(4,i) = face_color(4,i-1);
            end
            face_color(4,1) = buf;
        end
    end

    function reverse_turn_b()
        buf = face_color(1,1:3);
        face_color(1,3) = face_color(5,1);
        face_color(1,1:2) = face_color(5,7:8);
        face_color(5,1) = face_color(6,7);
        face_color(5,7:8) = face_color(6,5:6);
        face_color(6,5:7) = face_color(3,3:5);
        face_color(3,3:5) = buf;
        for j = 1:2
            buf = face_color(4,1);
            for i = 1:7
                face_color(4,i) = face_color(4,i+1);
            end
            face_color(4,8) = buf;
        end
    end




    function update_patches()
        for i = 1:6
            for j = 1:8
                update_single_patch(i, j);
            end
        end
    end

    function update_single_patch(i, j)
        patch(face_positions(i,(12*j-11):(12*j-8)), face_positions(i,(12*j-7):(12*j-4)), face_positions(i,(12*j-3):(12*j)), possible_colors(face_color(i,j),:), 'UIContextMenu', cmenu(i,j), 'UserData', [i j]);
    end

    function hide_arrows(arrows)
        for i = 0:length(arrows)-1
            arrows(i+1).Visible = 'Off';
        end
    end

    function solve_cube(~, ~)
        button_solve.Enable = 'off';

        vals = tabulate(face_color(:));
        vals2(1:6) = vals(:, 2);
        text_error.Visible = 'Off';
        text_not_solvable.Visible = 'off';
        text_solved.Visible = 'off';
        if ~isequal(vals2, [8 8 8 8 8 8])
            text_error.Visible = 'On';
        else
            turn_list = [];
            turn_list = generate_solution(face_color);
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
                button_next.Enable = 'off';
                button_prev.Enable = 'off';
                text_solved.Visible = 'on';
                text_solved.String = 'Already solved!';
            end
        end
        button_solve.Enable = 'on';
    end


    function next_step(~, ~)
        button_next.Enable = 'off';
        button_prev.Enable = 'off';
        turn(turn_list(solve_step));
        button_prev.Enable = 'on';
        solve_step = solve_step + 1;
        if ~(solve_step > length(turn_list))
            button_next.Enable = 'on';
        end
    end

    function prev_step(~, ~)
        button_next.Enable = 'off';
        button_prev.Enable = 'off';
        turn(get_reverse_turn(turn_list(solve_step - 1)));
        button_next.Enable = 'on';
        solve_step = solve_step - 1;
        if (solve_step ~= 1)
            button_prev.Enable = 'on';
        end
    end

    function reverse_turn = get_reverse_turn(current_turn)
        if mod(current_turn, 2) == 0
            reverse_turn = current_turn - 1;
        else
            reverse_turn = current_turn + 1;
        end
    end

end
