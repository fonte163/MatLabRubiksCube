function turns = generate_solution(face_color_code)
    turns = [];
    next_turn = 1;
    face_colors = face_color_code;


    yellow_edge_location();

    refresh_face_colors();



    refresh_face_colors();

    white_edge_orientation();

    refresh_face_colors();

    white_corner_orientation();

    refresh_face_colors();

    white_corner_permutation();




    function yellow_edge_location()
        yellow_edges = [];
        for i = 1:6
            for j = 2:2:8
                if (face_colors(i,j) == 6)
                    yellow_edges(end+1) = [i,j,face_colors(get_adjacent_edge_position(i,j))]; % !!!!!!!!!!!!!!!!!!!!
                end
            end
        end

        for egde = yellow_edges
            switch edge(1)
            case 1

            case 6
                if (edge(3) ~= (edge(2)-1)*2) % edge not already in correct position
                    switch edge(2)
                    case 2
                        turns = [turns, 9,9];
                    case 3
                        turns = [turns, 1,1];
                    case 4
                        turns = [turns, 11,11];
                    case 5
                        turns = [turns, 5,5];
                    end

                end
            otherwise
                switch edge(2)
                case 2

                end
            end

        end
    end

    function [k,l] = get_adjacent_edge_position(i,j)
        switch i
        case 1
            switch j
            case 2
                [k,l] = [4,2];
            case 4
                [k,l] = [3,2];
            case 6
                [k,l] = [2,2];
            case 8
                [k,l] = [5,2];
            end
        case 2
            switch j
            case 2
                [k,l] = [1,6];
            case 4
                [k,l] = [3,8];
            case 6
                [k,l] = [6,2];
            case 8
                [k,l] = [5,4];
            end
        case 3
            switch j
            case 2
                [k,l] = [1,4];
            case 4
                [k,l] = [4,8];
            case 6
                [k,l] = [6,4];
            case 8
                [k,l] = [3,4];
            end
        case 4
            switch j
            case 2
                [k,l] = [1,2];
            case 4
                [k,l] = [5,8];
            case 6
                [k,l] = [6,6];
            case 8
                [k,l] = [3,4];
            end
        case 5
            switch j
            case 2
                [k,l] = [1,8];
            case 4
                [k,l] = [2,8];
            case 6
                [k,l] = [6,8];
            case 8
                [k,l] = [4,4];
            end
        case 6
            switch j
            case 2
                [k,l] = [2,6];
            case 4
                [k,l] = [3,6];
            case 6
                [k,l] = [4,6];
            case 8
                [k,l] = [5,6];
            end
        end
    end

    function white_corner_permutation()
        white_corners = zeros(4);
        for i = 2:5
            if i ~= 5
                j = i+1;
            else
                j = 2;
            end
            if (face_colors(i,3) == 4 && face_colors(j,1) == 5)
                white_corners(i-1) = 1;
            elseif (face_colors(i,3) == 3 && face_colors(j,1) == 4)
                white_corners(i-1) = 2;
            elseif (face_colors(i,3) == 2 && face_colors(j,1) == 3)
                white_corners(i-1) = 3;
            elseif (face_colors(i,3) == 5 && face_colors(j,1) == 2)
                white_corners(i-1) = 4;
            else
                error('not solvable');
            end
        end

        if isequal(white_corners, [1 2 3 4])
            %do nothing
        elseif isequal(white_corners, [2 3 4 1])
            turns = [turns, 3];
        elseif isequal(white_corners, [3 4 1 2])
            turns = [turns, 3,3];
        elseif isequal(white_corners, [4 1 2 3])
            turns = [turns, 4];

        elseif isequal(white_corners, [1 4 3 2])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11,3];
        elseif isequal(white_corners, [4 3 2 1])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11];
        elseif isequal(white_corners, [3 2 1 4])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11,4];
        elseif isequal(white_corners, [2 1 3 4])
            turns = [turns, 6,2,12,5,10,6,11,5,1,12,2,9,1,11,3,3];

        elseif isequal(white_corners, [1 2 4 3])
            turns = [turns, 3,3,6,11,6,9,9,5,12,6,9,9,5,5,3];
        elseif isequal(white_corners, [1 3 2 4])
            turns = [turns, 3,5,10,5,11,11,6,9,5,11,11,5,5,4];
        elseif isequal(white_corners, [1 3 4 2])
            turns = [turns, 3,6,11,6,9,9,5,12,6,9,9,5,5,4];
        elseif isequal(white_corners, [1 4 2 3])
            turns = [turns, 6,11,6,9,9,5,12,6,9,9,5,5,3,3];

        else
            error('not solvable');
        end
    end


    function white_corner_orientation()
        correct_white = [];
        for i = 1:2:7
            if (face_colors(1, i) == 1)
                correct_white(end+1) = i;
            end
        end
        switch length(correct_white)
            case 0
                if (face_colors(2,1) == 1 && face_colors(2,3) == 1 && face_colors(4,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 9,1,3,2,4,1,3,2,4,1,3,2,4,10];
                elseif (face_colors(3,1) == 1 && face_colors(3,3) == 1 && face_colors(5,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 5,9,3,10,4,9,3,10,4,9,3,10,4,6];
                elseif (face_colors(2,3) == 1 && face_colors(4,1) == 1 && face_colors(5,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 1,3,3,1,1,4,1,1,4,1,1,3,3,1];
                elseif (face_colors(2,1) == 1 && face_colors(2,3) == 1 && face_colors(3,3) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 11,3,3,11,11,4,11,11,4,11,11,3,3,11];
                elseif (face_colors(2,1) == 1 && face_colors(3,1) == 1 && face_colors(3,3) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 5,3,3,5,5,4,5,5,4,5,5,3,3,5];
                elseif (face_colors(3,1) == 1 && face_colors(4,1) == 1 && face_colors(4,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,3,3,9,9,4,9,9,4,9,9,3,3,9];
                else
                    error('not solvable');
                end
            case 1
                if (face_colors(2,1) == 1 && face_colors(4,1) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 6,4,5,4,6,3,3,5];
                elseif (face_colors(2,1) == 1 && face_colors(3,1) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 10,4,9,4,10,3,3,9];
                elseif (face_colors(2,1) == 1 && face_colors(3,1) == 1 && face_colors(4,1) == 1)
                    turns = [turns, 2,4,1,4,2,3,3,1];
                elseif (face_colors(3,1) == 1 && face_colors(4,1) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 12,4,11,4,12,3,3,11];

                elseif (face_colors(2,3) == 1 && face_colors(4,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 5,3,6,3,5,4,4,6];
                elseif (face_colors(2,3) == 1 && face_colors(3,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,3,10,3,9,4,4,10];
                elseif (face_colors(2,3) == 1 && face_colors(3,3) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 1,3,2,3,1,4,4,2];
                elseif (face_colors(3,3) == 1 && face_colors(4,3) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 11,3,12,3,11,4,4,12];
                else
                    error('not solvable');
                end
            case 2
                if (face_colors(2,3) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 10,5,9,2,10,6,9,1];
                elseif (face_colors(2,1) == 1 && face_colors(3,3) == 1)
                    turns = [turns, 2,9,1,12,2,10,1,11];
                elseif (face_colors(3,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 12,1,11,6,12,2,11,5];
                elseif (face_colors(4,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 6,11,5,10,6,12,5,9];

                elseif (face_colors(2,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 5,9,2,10,6,9,1,10];
                elseif (face_colors(3,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,1,12,2,10,1,11,2];
                elseif (face_colors(2,3) == 1 && face_colors(4,1) == 1)
                    turns = [turns, 1,11,6,12,2,11,5,12];
                elseif (face_colors(3,3) == 1 && face_colors(5,1) == 1)
                    turns = [turns, 11,5,10,6,12,5,9,6];

                elseif (face_colors(2,1) == 1 && face_colors(2,3) == 1)
                    turns = [turns, 1,1,7,2,3,3,1,8,2,3,3,2];
                elseif (face_colors(3,1) == 1 && face_colors(3,3) == 1)
                    turns = [turns, 11,11,7,12,3,3,11,8,12,3,3,12];
                elseif (face_colors(4,1) == 1 && face_colors(4,3) == 1)
                    turns = [turns, 5,5,7,6,3,3,5,8,6,3,3,6];
                elseif (face_colors(5,1) == 1 && face_colors(5,3) == 1)
                    turns = [turns, 9,9,7,10,3,3,9,8,10,3,3,10];
                else
                    error('not solvable');
                end
            case 4
                %do nothing
            otherwise
                error('not solvable');
        end
    end


    function white_edge_orientation()
        correct_white = [];
        for i = 2:2:8
            if (face_colors(1, i) == 1)
                correct_white(end+1) = i;
            end
        end
        switch length(correct_white)
            case 0
                turns = [turns, 9,1,3,2,4,10,11,3,5,4,6,12];
            case 2
                if (correct_white(1) == 2 && correct_white(2) == 6)
                    turns = [turns, 1,11,3,12,4,2];
                elseif (correct_white(1) == 4 && correct_white(2) == 8)
                    turns = [turns, 9,1,3,2,4,10];

                elseif (correct_white(1) == 2 && correct_white(2) == 4)
                    turns = [turns, 5,3,9,4,10,6];
                elseif (correct_white(1) == 4 && correct_white(2) == 6)
                    turns = [turns, 11,3,5,4,6,12];
                elseif (correct_white(1) == 6 && correct_white(2) == 8)
                    turns = [turns, 1,3,11,4,12,2];
                elseif (correct_white(1) == 2 && correct_white(2) == 8)
                    turns = [turns, 9,3,1,4,2,10];
    			end
    		case 4
    			%do nothing
            otherwise
                error('not solvable');
        end
    end

    function refresh_face_colors()
        for i = next_turn:1:length(turns)
            turn(turns(i));
        end
    end



    function turn(dir)
        % R, R', U, U', L, L', D, D', F, F', B, B'
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
    end

    function turn_r()
        buf1 = face_colors(1, 3);
        buf2 = face_colors(1, 4);
        buf3 = face_colors(1, 5);
        face_colors(1, 3:5) = face_colors(2, 3:5);
        face_colors(2, 3:5) = face_colors(6, 3:5);
        face_colors(6, 3:4) = face_colors(4, 7:8);
        face_colors(6, 5) = face_colors(4, 1);
        face_colors(4, 7) = buf1;
        face_colors(4, 8) = buf2;
        face_colors(4, 1) = buf3;
        for j = 1:2
            buf = face_colors(3,8);
            for i = 8:-1:2
                face_colors(3,i) = face_colors(3,i-1);
            end
            face_colors(3,1) = buf;
        end
    end

    function reverse_turn_r()
        buf = face_colors(1, 3:5);
        face_colors(1, 3:4) = face_colors(4, 7:8);
        face_colors(1, 5) = face_colors(4, 1);
        face_colors(4, 7:8) = face_colors(6, 3:4);
        face_colors(4, 1) = face_colors(6, 5);
        face_colors(6, 3:5) = face_colors(2, 3:5);
        face_colors(2, 3:5) = buf;
        for j = 1:2
            buf = face_colors(3,1);
            for i = 1:7
                face_colors(3,i) = face_colors(3,i+1);
            end
            face_colors(3,8) = buf;
        end
    end

    function turn_u()
        buf = face_colors(2, 1:3);
        for i = 2:4
            face_colors(i, 1:3) = face_colors(i+1, 1:3);
        end
        face_colors(5, 1:3) = buf;
        for i = 1:2
            buf = face_colors(1,8);
            for i = 8:-1:2
                face_colors(1,i) = face_colors(1,i-1);
            end
            face_colors(1,1) = buf;
        end
    end

    function reverse_turn_u()
        buf = face_colors(5, 1:3);
        for i = 5:-1:3
            face_colors(i, 1:3) = face_colors(i-1, 1:3);
        end
        face_colors(2, 1:3) = buf;
        for j = 1:2
            buf = face_colors(1,1);
            for i = 1:7
                face_colors(1,i) = face_colors(1,i+1);
            end
            face_colors(1,8) = buf;
        end
    end

    function turn_l()
        buf1 = face_colors(1, 1);
        buf2 = face_colors(1, 7:8);
        face_colors(1, 1) = face_colors(4, 5);
        face_colors(1, 7:8) = face_colors(4, 3:4);
        face_colors(4, 5) = face_colors(6, 1);
        face_colors(4, 3:4) = face_colors(6, 7:8);
        face_colors(6, 1) = face_colors(2, 1);
        face_colors(6, 7:8) = face_colors(2, 7:8);
        face_colors(2, 1) = buf1;
        face_colors(2, 7:8) = buf2;
        for i = 1:2
            buf = face_colors(5,8);
            for i = 8:-1:2
                face_colors(5,i) = face_colors(5,i-1);
            end
            face_colors(5,1) = buf;
        end
    end

    function reverse_turn_l()
        buf1 = face_colors(1, 1);
        buf2 = face_colors(1, 7:8);
        face_colors(1, 1) = face_colors(2, 1);
        face_colors(1, 7:8) = face_colors(2, 7:8);
        face_colors(2, 1) = face_colors(6, 1);
        face_colors(2, 7:8) = face_colors(6, 7:8);
        face_colors(6, 1) = face_colors(4, 5);
        face_colors(6, 7:8) = face_colors(4, 3:4);
        face_colors(4, 5) = buf1;
        face_colors(4, 3:4) = buf2;
        for j = 1:2
            buf = face_colors(5,1);
            for i = 1:7
                face_colors(5,i) = face_colors(5,i+1);
            end
            face_colors(5,8) = buf;
        end
    end

    function turn_d()
        buf = face_colors(2, 5:7);
        face_colors(2, 5:7) = face_colors(5, 5:7);
        face_colors(5, 5:7) = face_colors(4, 5:7);
        face_colors(4, 5:7) = face_colors(3, 5:7);
        face_colors(3, 5:7) = buf;
        for i = 1:2
            buf = face_colors(6,8);
            for i = 8:-1:2
                face_colors(6,i) = face_colors(6,i-1);
            end
            face_colors(6,1) = buf;
        end
    end

    function reverse_turn_d()
        buf = face_colors(2, 5:7);
        face_colors(2, 5:7) = face_colors(3, 5:7);
        face_colors(3, 5:7) = face_colors(4, 5:7);
        face_colors(4, 5:7) = face_colors(5, 5:7);
        face_colors(5, 5:7) = buf;
        for j = 1:2
            buf = face_colors(6,1);
            for i = 1:7
                face_colors(6,i) = face_colors(6,i+1);
            end
            face_colors(6,8) = buf;
        end
    end

    function turn_f()
        buf1 = face_colors(1, 7);
        buf2 = face_colors(1, 5:6);
        face_colors(1, 5:7) = face_colors(5, 3:5);
        face_colors(5, 3:5) = face_colors(6, 1:3);
        face_colors(6, 1:2) = face_colors(3, 7:8);
        face_colors(6, 3) = face_colors(3, 1);
        face_colors(3, 1) = buf1;
        face_colors(3, 7:8) = buf2;
        for i = 1:2
            buf = face_colors(2,8);
            for i = 8:-1:2
                face_colors(2,i) = face_colors(2,i-1);
            end
            face_colors(2,1) = buf;
        end
    end

    function reverse_turn_f()
        buf = face_colors(1, 5:7);
        face_colors(1, 7) = face_colors(3, 1);
        face_colors(1, 5:6) = face_colors(3, 7:8);
        face_colors(3, 1) = face_colors(6,3);
        face_colors(3,7:8) = face_colors(6,1:2);
        face_colors(6,1:3) = face_colors(5,3:5);
        face_colors(5,3:5) = buf;
        for j = 1:2
            buf = face_colors(2,1);
            for i = 1:7
                face_colors(2,i) = face_colors(2,i+1);
            end
            face_colors(2,8) = buf;
        end
    end

function turn_b()
        buf1 = face_colors(1,1:2);
        buf2 = face_colors(1,3);
        face_colors(1,1:3) = face_colors(3,3:5);
        face_colors(3,3:5) = face_colors(6,5:7);
        face_colors(6,5:6) = face_colors(5,7:8);
        face_colors(6,7) = face_colors(5,1);
        face_colors(5,7:8) = buf1;
        face_colors(5,1) = buf2;
        for i = 1:2
            buf = face_colors(4,8);
            for i = 8:-1:2
                face_colors(4,i) = face_colors(4,i-1);
            end
            face_colors(4,1) = buf;
        end
    end

    function reverse_turn_b()
        buf = face_colors(1,1:3);
        face_colors(1,3) = face_colors(5,1);
        face_colors(1,1:2) = face_colors(5,7:8);
        face_colors(5,1) = face_colors(6,7);
        face_colors(5,7:8) = face_colors(6,5:6);
        face_colors(6,5:7) = face_colors(3,3:5);
        face_colors(3,3:5) = buf;
        for j = 1:2
            buf = face_colors(4,1);
            for i = 1:7
                face_colors(4,i) = face_colors(4,i+1);
            end
            face_colors(4,8) = buf;
        end
    end
end
